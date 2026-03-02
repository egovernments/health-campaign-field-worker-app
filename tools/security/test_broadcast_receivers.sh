#!/bin/bash

# Configuration
PACKAGE_NAME="com.digit.hcm"
WATCHDOG_RECEIVER="id.flutter.flutter_background_service.WatchdogReceiver"
BOOT_RECEIVER="id.flutter.flutter_background_service.BootReceiver"

# Optional: path to the built APK for binary manifest verification.
# If set, aapt2 is used as a secondary check to confirm exported=false
# and eliminate ADB shell false positives.
# Usage: APK_PATH=/path/to/app.apk ./test_broadcast_receivers.sh
APK_PATH="${APK_PATH:-}"
# Path to aapt2 binary (auto-detected from ANDROID_HOME if not set)
AAPT2_PATH="${AAPT2_PATH:-}"

echo "==========================================================="
echo " Testing Insecure Broadcast Receiver Mitigations"
echo " Package: $PACKAGE_NAME"
echo "==========================================================="
echo ""

# Check if ADB is available
if ! command -v adb &> /dev/null; then
    echo "[!] ADB could not be found. Please ensure Android platform-tools"
    echo "    are installed and adb is in your system PATH."
    exit 1
fi

# Check if an emulator/device is connected
if ! adb get-state 1>/dev/null 2>&1; then
    echo "[!] No Android device/emulator found. Please connect a device or"
    echo "    start an emulator."
    exit 1
fi

# Check if the app is installed
if ! adb shell pm list packages | grep -q "^package:${PACKAGE_NAME}$"; then
    echo "[!] App $PACKAGE_NAME is not installed on the connected device."
    echo "    Please install the app on the device and try again."
    exit 1
fi

# Auto-detect aapt2 from ANDROID_HOME or common SDK paths
if [ -z "$AAPT2_PATH" ]; then
    SDK_ROOTS=("$ANDROID_HOME" "$HOME/Library/Android/sdk" "$HOME/Android/Sdk" \
               "$LOCALAPPDATA/Android/Sdk" "/usr/local/lib/android/sdk")
    for sdk in "${SDK_ROOTS[@]}"; do
        if [ -d "$sdk/build-tools" ]; then
            AAPT2_PATH=$(find "$sdk/build-tools" -name "aapt2" -o -name "aapt2.exe" 2>/dev/null \
                         | sort -rV | head -1)
            [ -n "$AAPT2_PATH" ] && break
        fi
    done
fi

# Verify aapt2 manifest: returns 0 (exported=false/not found) or 1 (exported=true)
# Usage: manifest_exported_check <receiver_class>
function manifest_exported_check() {
    local receiver_class=$1
    [ -z "$APK_PATH" ] && return 2   # no APK path → skip
    [ -z "$AAPT2_PATH" ] && return 2 # no aapt2    → skip

    local xml
    xml=$("$AAPT2_PATH" dump xmltree "$APK_PATH" --file AndroidManifest.xml 2>/dev/null)
    if [ -z "$xml" ]; then return 2; fi

    # Extract the block for this receiver and check its exported attribute.
    # Strategy: find the line with the receiver name, then scan forward until
    # the next 'E: receiver' opening tag for the exported= attribute.
    local in_receiver=0
    local result=2  # 2 = not found

    while IFS= read -r line; do
        if echo "$line" | grep -q "\"${receiver_class}\""; then
            in_receiver=1
            continue
        fi
        if [ "$in_receiver" -eq 1 ]; then
            # Stop at next receiver/service/activity element
            if echo "$line" | grep -qP "^\s+E: (receiver|service|activity|application)\b"; then
                break
            fi
            if echo "$line" | grep -q "android:exported"; then
                if echo "$line" | grep -q "=true"; then
                    result=1  # exported=true → vulnerable
                else
                    result=0  # exported=false → secure
                fi
                break
            fi
        fi
    done <<< "$xml"

    return $result
}

TOTAL_TESTS=0
SUCCESS_COUNT=0
FAILURE_COUNT=0

function test_receiver() {
    local receiver=$1
    local action=$2
    local action_param=""
    
    TOTAL_TESTS=$((TOTAL_TESTS + 1))

    if [ ! -z "$action" ]; then
        action_param="-a $action"
    fi

    echo "[*] Testing ${receiver}..."
    local cmd="adb shell am broadcast $action_param -n $PACKAGE_NAME/$receiver"
    echo "    Command: $cmd"
    
    # Run the command and capture output.
    # Note: 'am broadcast' can write to stderr if there's a security exception.
    local output
    output=$($cmd 2>&1)
    
    # Format the output slightly for readability
    echo "$output" | while read -r line; do
        echo "    > $line"
    done

    if echo "$output" | grep -qi "Permission Denial"; then
        echo "    Result : [SECURE] Access Denied. The receiver is not exported or requires permissions."
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    elif echo "$output" | grep -qi "Broadcast completed"; then
        # am broadcast -n from ADB shell (uid=2000) can bypass android:exported=false
        # because the shell user has elevated privileges.  Perform a secondary
        # check against the binary APK manifest via aapt2 to eliminate this
        # false positive before declaring a real vulnerability.
        manifest_exported_check "$receiver"
        local manifest_status=$?

        if [ "$manifest_status" -eq 0 ]; then
            echo "    Note   : Broadcast succeeded due to ADB shell privilege bypass (uid=2000)."
            echo "             Binary manifest verification confirms android:exported=false."
            echo "             Real apps (uid>=10000) cannot send this broadcast."
            echo "    Result : [SECURE] Manifest confirms exported=false. ADB false positive."
            SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
        elif [ "$manifest_status" -eq 1 ]; then
            echo "    Result : [VULNERABLE] Broadcast completed AND manifest confirms exported=true!"
            FAILURE_COUNT=$((FAILURE_COUNT + 1))
        else
            echo "    Note   : Could not perform secondary manifest verification"
            echo "             (set APK_PATH and ensure aapt2 is available for confirmation)."
            echo "    Result : [LIKELY VULNERABLE] Broadcast completed. Verify exported attribute manually."
            FAILURE_COUNT=$((FAILURE_COUNT + 1))
        fi
    else
        echo "    Result : [UNKNOWN] Could not determine status. Please review the output above."
        FAILURE_COUNT=$((FAILURE_COUNT + 1))
    fi
    echo ""
}

# Test both broadcast receivers
APK_PATH="${APK_PATH:-../../apps/health_campaign_field_worker_app/build/app/outputs/flutter-apk/app-release.apk}"
test_receiver "$WATCHDOG_RECEIVER" ""
test_receiver "$BOOT_RECEIVER" "android.intent.action.BOOT_COMPLETED"

echo "==========================================================="
echo " Testing Complete."
echo " Total Tests Run : $TOTAL_TESTS"
echo " Passed (Secure) : $SUCCESS_COUNT"
echo " Failed (Vuln)   : $FAILURE_COUNT"
echo "==========================================================="
