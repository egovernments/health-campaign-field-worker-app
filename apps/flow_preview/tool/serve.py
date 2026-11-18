#!/usr/bin/env python3
"""Serve the built flow preview locally, with a read-only DIGIT proxy.

DIGIT servers do not allow browser pages on other origins to read their
responses (CORS), so the preview cannot call the localisation or MDMS search
APIs directly. This server serves build/web and forwards a small allowlist of
read-only search calls to a DIGIT server, so the browser only ever talks to
127.0.0.1.

Usage (from apps/flow_preview, after `flutter build web`):
  python3 tool/serve.py [--port 8099] [--allow-host .digit.org]

The page calls  /digit-proxy/<path>?<query>  with header
X-Digit-Upstream: https://<server>  ; the proxy checks both against the
allowlists below and forwards the request. Nothing else is proxied.

Development stand-ins for the campaign console (optional):
  /embed-host     tool/embed_host.html, a host page for ?embed=1
  /drawer-test    tool/console_drawer_test.html, the console's real
                  AppPreviewDrawer.js with stubbed console services; needs
                  --console-src (served read-only at /console-src/, .js and
                  .json only) and --upstream
  --upstream URL  also forwards the same allowlisted paths at the ROOT
                  (/<path>) to URL, the way the console's dev server proxies
                  them, for an embedded preview that calls its own origin
"""
import argparse
import http.server
import os
import sys
import urllib.error
import urllib.parse
import urllib.request

PROXY_PREFIX = "/digit-proxy/"
EMBED_HOST_PAGE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "embed_host.html")
DRAWER_TEST_PAGE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "console_drawer_test.html")
# Read-only search endpoints, plus sign-in. Nothing that creates or changes
# data on the server is proxied. Paths match HCM-SERVICE-REGISTRY on DIGIT.
LOGIN_PATH = "user/oauth/token"
ALLOWED_PATHS = (
    "localization/messages/v1/_search",
    "egov-mdms-service/v2/_search",
    "mdms-v2/v2/_search",
    LOGIN_PATH,
    "health-project/staff/v1/_search",
    "health-project/v1/_search",
    "boundary-service/boundary-relationships/_search",
)


class Handler(http.server.SimpleHTTPRequestHandler):
    allowed_host_suffixes = (".digit.org",)

    upstream = None      # --upstream
    console_src = None   # --console-src

    def do_POST(self):
        if self.path.startswith(PROXY_PREFIX):
            self._proxy()
        elif self._root_api_path() is not None:
            self._proxy_root()
        else:
            self.send_error(404)

    def do_GET(self):
        if self.path.startswith(PROXY_PREFIX):
            self._proxy()
        elif self.path.split("?")[0] in ("/embed-host", "/embed-host/"):
            self._send_file(EMBED_HOST_PAGE, "text/html; charset=utf-8")
        elif self.path.split("?")[0] in ("/drawer-test", "/drawer-test/"):
            self._send_file(DRAWER_TEST_PAGE, "text/html; charset=utf-8")
        elif self.path.startswith("/console-src/"):
            self._console_src()
        elif self._root_api_path() is not None:
            self._proxy_root()
        else:
            super().do_GET()

    def _send_file(self, path, ctype):
        # Development pages live in tool/, so they are never part of build/web.
        with open(path, "rb") as f:
            data = f.read()
        self.send_response(200)
        self.send_header("Content-Type", ctype)
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)

    def _console_src(self):
        # Read-only view of the console module's sources for /drawer-test.
        if not self.console_src:
            self.send_error(404, "Start serve.py with --console-src")
            return
        rel = urllib.parse.unquote(self.path[len("/console-src/"):].split("?")[0])
        full = os.path.realpath(os.path.join(self.console_src, rel))
        if not full.startswith(self.console_src + os.sep) or not os.path.isfile(full):
            self.send_error(404)
            return
        types = {".js": "text/javascript; charset=utf-8", ".json": "application/json"}
        ctype = types.get(os.path.splitext(full)[1])
        if ctype is None:
            self.send_error(403, "Only .js and .json files are served")
            return
        self._send_file(full, ctype)

    def _root_api_path(self):
        """The allowlisted API path of a root request when --upstream is set."""
        if not self.upstream:
            return None
        path = self.path.lstrip("/").partition("?")[0]
        return path if path in ALLOWED_PATHS else None

    def _proxy_root(self):
        query = self.path.partition("?")[2]
        self._forward(self._root_api_path(), query, self.upstream)

    def end_headers(self):
        # Always serve fresh files so rebuilds show up without clearing caches.
        self.send_header("Cache-Control", "no-store")
        super().end_headers()

    def _proxy(self):
        rest = self.path[len(PROXY_PREFIX):]
        path, _, query = rest.partition("?")
        if path not in ALLOWED_PATHS:
            self.send_error(403, "Only read-only search endpoints are proxied")
            return
        upstream = self.headers.get("X-Digit-Upstream", "")
        parsed = urllib.parse.urlparse(upstream)
        host = parsed.hostname or ""
        if parsed.scheme != "https" or not host.endswith(self.allowed_host_suffixes):
            self.send_error(403, f"Upstream not allowed: {upstream!r}")
            return
        self._forward(path, query, f"https://{host}/")

    def _forward(self, path, query, upstream):
        host = urllib.parse.urlparse(upstream).hostname
        url = f"https://{host}/{path}" + (f"?{query}" if query else "")
        length = int(self.headers.get("Content-Length") or 0)
        body = self.rfile.read(length) if length else None
        req = urllib.request.Request(
            url,
            data=body,
            method=self.command,
            headers=self._forward_headers(path),
        )
        try:
            with urllib.request.urlopen(req, timeout=60) as res:
                data, status, ctype = res.read(), res.status, res.headers.get("Content-Type", "application/json")
        except urllib.error.HTTPError as e:
            data, status, ctype = e.read(), e.code, e.headers.get("Content-Type", "text/plain")
            if path == LOGIN_PATH:
                # The server's error reply (never the request, which holds the
                # password) so failed sign-ins can be diagnosed.
                sys.stderr.write(f"sign-in rejected by {host}: {status} {data[:300]!r}\n")
        except urllib.error.URLError as e:
            self.send_error(502, f"Cannot reach {host}: {e.reason}")
            return
        self.send_response(status)
        self.send_header("Content-Type", ctype)
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)

    def _forward_headers(self, path):
        headers = {"Content-Type": self.headers.get("Content-Type", "application/json")}
        # The token endpoint needs the client's Basic authorization header.
        # Nothing else gets an Authorization header (searches carry the token
        # in RequestInfo, as the app does). Credentials are never logged.
        if path == LOGIN_PATH and self.headers.get("Authorization"):
            headers["Authorization"] = self.headers["Authorization"]
        return headers

    def log_message(self, fmt, *args):
        sys.stderr.write("%s - %s\n" % (self.address_string(), fmt % args))


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--port", type=int, default=8099)
    ap.add_argument("--dir", default=os.path.join(os.path.dirname(__file__), "..", "build", "web"))
    ap.add_argument("--allow-host", action="append", default=[],
                    help="extra allowed upstream host suffix (default .digit.org)")
    ap.add_argument("--upstream",
                    help="also forward allowlisted API paths at the root to this https DIGIT server")
    ap.add_argument("--console-src",
                    help="campaign-manager module src/ directory, for /drawer-test")
    a = ap.parse_args()
    if a.allow_host:
        Handler.allowed_host_suffixes = tuple([".digit.org", *a.allow_host])
    if a.upstream:
        up = urllib.parse.urlparse(a.upstream)
        if up.scheme != "https" or not (up.hostname or "").endswith(Handler.allowed_host_suffixes):
            sys.exit(f"--upstream must be https on {', '.join(Handler.allowed_host_suffixes)}")
        Handler.upstream = a.upstream
    if a.console_src:
        Handler.console_src = os.path.realpath(a.console_src)
        if not os.path.isdir(Handler.console_src):
            sys.exit(f"--console-src is not a directory: {a.console_src}")
    directory = os.path.abspath(a.dir)
    if not os.path.isfile(os.path.join(directory, "index.html")):
        sys.exit(f"No build found in {directory}. Run `flutter build web` first.")
    handler = lambda *args, **kw: Handler(*args, directory=directory, **kw)
    server = http.server.ThreadingHTTPServer(("127.0.0.1", a.port), handler)
    print(f"Flow preview: http://127.0.0.1:{a.port}/  (proxy: {PROXY_PREFIX}*)")
    print(f"Embed host (console stand-in): http://127.0.0.1:{a.port}/embed-host")
    if a.console_src:
        print(f"Console drawer test: http://127.0.0.1:{a.port}/drawer-test")
    if a.upstream:
        print(f"Root API paths forwarded to {a.upstream}")
    server.serve_forever()


if __name__ == "__main__":
    main()
