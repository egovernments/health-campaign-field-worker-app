#!/bin/bash

# Configuration
PACKAGE_NAME="com.digit.hcm"
WATCHDOG_RECEIVER="id.flutter.flutter_background_service.WatchdogReceiver"
BOOT_RECEIVER="id.flutter.flutter_background_service.BootReceiver"

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
        echo "    Result : [VULNERABLE] Broadcast completed successfully. The receiver is exported!"
        FAILURE_COUNT=$((FAILURE_COUNT + 1))
    else
        echo "    Result : [UNKNOWN] Could not determine status. Please review the output above."
        FAILURE_COUNT=$((FAILURE_COUNT + 1))
    fi
    echo ""
}

# Test both broadcast receivers
test_receiver "$WATCHDOG_RECEIVER" ""
test_receiver "$BOOT_RECEIVER" "android.intent.action.BOOT_COMPLETED"

echo "==========================================================="
echo " Testing Complete."
echo " Total Tests Run : $TOTAL_TESTS"
echo " Passed (Secure) : $SUCCESS_COUNT"
echo " Failed (Vuln)   : $FAILURE_COUNT"
echo "==========================================================="
