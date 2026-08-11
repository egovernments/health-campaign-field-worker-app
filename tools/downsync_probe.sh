#!/usr/bin/env bash
# Probe the HCM beneficiary down-sync endpoint and report what it actually returns.
#
# Why this exists: the app reported "Downloaded successfully" while the local
# `individual` table stayed at 0 rows and `household` had 210. Client-side
# instrumentation showed `Individuals` arriving with 0 records and no decode
# errors, which points at the payload rather than the app. This script fetches
# that payload directly so the per-entity counts can be confirmed server-side.
#
# NOTE ON ROLES: the download endpoint is role-gated. `superuser1` receives
# HTTP 401 "You are not authorized" despite holding SUPERUSER. Use the field
# account the device logs in with (e.g. field01).
#
# Usage:
#   ./downsync_probe.sh <username> <password> [locality] [limit]
#
# Example:
#   ./downsync_probe.sh field01 'somepassword' SL_C1_D2_CH2_V2 100

set -euo pipefail

BASE_URL="${BASE_URL:-https://sierraleone-hcm-dev.digit.org}"
TENANT="${TENANT:-sierraleone}"
PROJECT_ID="${PROJECT_ID:-715f7f91-a619-4f94-9a8a-758a1fc31674}"   # PJT-SL-SMC-001

USERNAME="${1:-}"
PASSWORD="${2:-}"
LOCALITY="${3:-SL_C1_D2_CH2_V2}"
LIMIT="${4:-100}"

if [[ -z "$USERNAME" || -z "$PASSWORD" ]]; then
  echo "usage: $0 <username> <password> [locality] [limit]" >&2
  exit 2
fi

OUT_DIR="$(mktemp -d)"
trap 'echo; echo "raw responses kept in: $OUT_DIR"' EXIT

command -v jq >/dev/null || { echo "jq is required (brew install jq)" >&2; exit 3; }

# ---------------------------------------------------------------- 1. auth ----
echo "==> requesting token for '$USERNAME' on tenant '$TENANT'"
http_code=$(curl -s -o "$OUT_DIR/auth.json" -w '%{http_code}' --max-time 30 \
  --location "$BASE_URL/user/oauth/token" \
  --header 'authorization: Basic ZWdvdi11c2VyLWNsaWVudDo=' \
  --header 'content-type: application/x-www-form-urlencoded' \
  --data-urlencode "username=$USERNAME" \
  --data-urlencode "password=$PASSWORD" \
  --data-urlencode 'grant_type=password' \
  --data-urlencode 'scope=read' \
  --data-urlencode "tenantId=$TENANT" \
  --data-urlencode 'userType=EMPLOYEE')

if [[ "$http_code" != "200" ]]; then
  echo "!! token request failed (HTTP $http_code)" >&2
  jq -r '.error_description // .error // .' "$OUT_DIR/auth.json" >&2 || cat "$OUT_DIR/auth.json" >&2
  exit 1
fi

TOKEN=$(jq -r '.access_token' "$OUT_DIR/auth.json")
USER_INFO=$(jq -c '.UserRequest | {
  id, uuid, userName, name, mobileNumber, emailId, type, active: true,
  tenantId,
  roles: [.roles[] | {name, code, tenantId}]
}' "$OUT_DIR/auth.json")

echo "    ok — user=$(jq -r '.UserRequest.userName' "$OUT_DIR/auth.json") \
roles=$(jq -r '[.UserRequest.roles[].code] | join(",")' "$OUT_DIR/auth.json")"

# ------------------------------------------------------------- 2. downsync ---
echo
echo "==> POST /referralmanagement/beneficiary-downsync/v1/_get"
echo "    project=$PROJECT_ID locality=$LOCALITY limit=$LIMIT"

REQUEST=$(jq -n \
  --argjson userInfo "$USER_INFO" \
  --arg token "$TOKEN" \
  --arg tenant "$TENANT" \
  --arg project "$PROJECT_ID" \
  --arg locality "$LOCALITY" \
  --argjson limit "$LIMIT" \
  '{
     RequestInfo: {
       apiId: "health-hcm", ver: "1.0", action: "_search",
       msgId: "downsync-probe", authToken: $token, userInfo: $userInfo
     },
     DownsyncCriteria: {
       tenantId: $tenant,
       projectId: $project,
       locality: $locality,
       offset: 0,
       limit: $limit,
       lastSyncedTime: null,
       totalCount: null
     }
   }')

http_code=$(curl -s -o "$OUT_DIR/downsync.json" -w '%{http_code}' --max-time 120 \
  --location "$BASE_URL/referralmanagement/beneficiary-downsync/v1/_get?tenantId=$TENANT&limit=$LIMIT&offset=0" \
  --header 'Content-Type: application/json' \
  --data "$REQUEST")

echo "    HTTP $http_code"

if [[ "$http_code" != "200" ]]; then
  echo "!! download failed" >&2
  jq -r '.Errors[]? | "\(.code): \(.message)"' "$OUT_DIR/downsync.json" 2>/dev/null \
    || head -c 400 "$OUT_DIR/downsync.json" >&2
  echo >&2
  if [[ "$http_code" == "401" ]]; then
    echo "   (401 from the access-control filter usually means the request URI is not" >&2
    echo "    registered for the caller's roles. The correct path comes from MDMS" >&2
    echo "    HCM-SERVICE-REGISTRY.serviceRegistry — entityName 'Downsync'.)" >&2
  fi
  exit 1
fi

# --------------------------------------------------------------- 3. report ---
echo
echo "==> entity counts in the response"
jq -r '
  (.Downsync // .) as $d
  | ($d.DownsyncCriteria.totalCount // "n/a") as $total
  | "    DownsyncCriteria.totalCount = \($total)",
    ( $d
      | to_entries
      | map(select(.value | type == "array"))
      | sort_by(-(.value | length))
      | .[]
      | "    \(.key): \(.value | length)"
    )
' "$OUT_DIR/downsync.json"

echo
echo "==> Individuals detail (the entity that is not persisting)"
jq -r '
  (.Downsync // .).Individuals as $i
  | if ($i | not) then "    key absent from response entirely"
    elif ($i | length) == 0 then "    present but EMPTY — server returned no individuals"
    else
      "    count=\($i | length)",
      "    first record clientReferenceId=\($i[0].clientReferenceId)",
      "    identifiers=\($i[0].identifiers | tojson)",
      "    identifiers missing individualClientReferenceId: \(
         [ $i[] | .identifiers // [] | .[]
           | select(has("individualClientReferenceId") | not) ] | length
       )"
    end
' "$OUT_DIR/downsync.json"

echo
echo "==> full response saved to $OUT_DIR/downsync.json"
