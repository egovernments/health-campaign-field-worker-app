#!/bin/bash

PACKAGE_NAME="com.digit.hcm"

echo "==========================================================="
echo " Testing Root Detection Bypass Prevention Mitigation"
echo " Package: $PACKAGE_NAME"
echo "==========================================================="
echo ""

# Check ADB
if ! command -v adb &> /dev/null; then
    echo "[!] ADB could not be found. Please ensure Android platform-tools"
    echo "    are installed and adb is in your system PATH."
    exit 1
fi

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

function test_hook_framework_detection() {
    echo "[*] Testing Hooking Framework Detection (Frida Bypass Simulation)"
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    
    echo "    > Creating pseudo frida-server file at /data/local/tmp/frida-server"
    # Create fake frida-server file that does not require root to place
    adb shell "echo 'fake_frida_binary' > /data/local/tmp/frida-server"
    adb shell chmod 777 /data/local/tmp/frida-server
    
    echo "    > Clear logcat and launch app..."
    adb logcat -c
    adb shell am force-stop $PACKAGE_NAME
    
    # Launch app using monkey
    adb shell monkey -p $PACKAGE_NAME -c android.intent.category.LAUNCHER 1 > /dev/null 2>&1
    
    echo "    > Waiting for app to perform security checks (10s)..."
    sleep 10
    
    # Check logcat for our security threat logs logged by RootDetectionUtils.dart
    local log_output=$(adb logcat -d | grep -i "Security threat detected")
    
    if echo "$log_output" | grep -qi "hook"; then
         echo "    > Log output: $log_output"
         echo "    Result : [SECURE] App successfully detected the hooking framework!"
         SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    elif [[ ! -z "$log_output" ]]; then
         echo "    > Log output: $log_output"
         echo "    Result : [SECURE] App detected a security threat, but might not specifically be hook."
         SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
         echo "    > No security threat logged by the app."
         echo "    Result : [VULNERABLE] App failed to detect the hooking framework or checks were bypassed."
         FAILURE_COUNT=$((FAILURE_COUNT + 1))
    fi
    
    # Cleanup
    adb shell rm /data/local/tmp/frida-server
    echo ""
}

function test_root_detection() {
    echo "[*] Testing Root Detection & Emulator Status..."
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    
    # Try to see if device is actually rooted by invoking su
    local is_device_rooted=$(adb shell "su -c 'echo root_test' 2>/dev/null" || echo "")
    local is_emulator=$(adb shell getprop ro.kernel.qemu)
    
    if [[ "$is_device_rooted" == "root_test" ]]; then
        echo "    > Device has root access."
    elif [[ "$is_emulator" == "1" ]]; then
        echo "    > Device is an emulator."
    else
        echo "    > Device appears to be a physical non-rooted device."
    fi

    echo "    > Clear logcat and launch app..."
    adb logcat -c
    adb shell am force-stop $PACKAGE_NAME
    adb shell monkey -p $PACKAGE_NAME -c android.intent.category.LAUNCHER 1 > /dev/null 2>&1
    
    echo "    > Waiting for app to perform security checks (10s)..."
    sleep 10

    local log_output=$(adb logcat -d | grep -i "Security threat detected")
    
    if [[ ! -z "$log_output" ]]; then
         echo "    > Log output: $log_output"
         echo "    Result : [SECURE] App successfully detected insecure environment (root/emulator)!"
         SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
         if [[ "$is_device_rooted" == "root_test" || "$is_emulator" == "1" ]]; then
             echo "    > No security threat logged by the app."
             echo "    Result : [VULNERABLE] App failed to detect root/emulator environment."
             FAILURE_COUNT=$((FAILURE_COUNT + 1))
         else
             echo "    > No security threat logged by the app (expected on clean device)."
             echo "    Result : [SECURE] App is running cleanly on a non-rooted device."
             SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
         fi
    fi
    echo ""
}

test_hook_framework_detection
test_root_detection

echo "==========================================================="
echo " Testing Complete."
echo " Total Tests Run : $TOTAL_TESTS"
echo " Passed (Secure) : $SUCCESS_COUNT"
echo " Failed (Vuln)   : $FAILURE_COUNT"
echo "==========================================================="
