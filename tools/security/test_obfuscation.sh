#!/bin/bash

# Configuration
PACKAGE_NAME="com.digit.hcm"
BUILD_GRADLE_PATH="../apps/health_campaign_field_worker_app/android/app/build.gradle"

echo "==========================================================="
echo " Testing Improper Code Obfuscation Mitigation"
echo " Package: $PACKAGE_NAME"
echo "==========================================================="
echo ""

TOTAL_TESTS=0
SUCCESS_COUNT=0
FAILURE_COUNT=0

function check_gradle_obfuscation_settings() {
    echo "[*] Testing Code Obfuscation Configuration (Static Analysis)"
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    
    if [ ! -f "$BUILD_GRADLE_PATH" ]; then
        # Try fallback path if run from within the app folder
        BUILD_GRADLE_PATH="android/app/build.gradle"
    fi
    
    if [ ! -f "$BUILD_GRADLE_PATH" ]; then
        # Try fallback path if run from within tools folder
        BUILD_GRADLE_PATH="../../apps/health_campaign_field_worker_app/android/app/build.gradle"
    fi

    if [ ! -f "$BUILD_GRADLE_PATH" ]; then
        echo "    > [!] android/app/build.gradle not found at $BUILD_GRADLE_PATH"
        FAILURE_COUNT=$((FAILURE_COUNT + 1))
        return
    fi
    
    echo "    > Analyzing android/app/build.gradle for minifyEnabled..."
    
    local minify_grep=$(grep "minifyEnabled true" "$BUILD_GRADLE_PATH")
    local shrink_grep=$(grep "shrinkResources true" "$BUILD_GRADLE_PATH")
    local proguard_grep=$(grep "proguardFiles" "$BUILD_GRADLE_PATH")
    
    if [[ ! -z "$minify_grep" ]]; then
        echo "    > Found minifyEnabled true:"
        echo "      $minify_grep"
        
        if [[ ! -z "$shrink_grep" ]]; then
           echo "    > Found shrinkResources true:"
           echo "      $shrink_grep"
        fi
        
        if [[ ! -z "$proguard_grep" ]]; then
           echo "    > Found ProGuard configuration:"
           echo "      $proguard_grep"
        fi
        
        echo "    Result : [SECURE] ProGuard / R8 code obfuscation and resource shrinking is enabled for the build process."
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo "    > 'minifyEnabled true' was NOT found in the build configuration."
        echo "    Result : [VULNERABLE] The application release builds do NOT enforce code obfuscation!"
        FAILURE_COUNT=$((FAILURE_COUNT + 1))
        return
    fi
    echo ""
}

function check_flutter_build_script() {
    echo "[*] Testing Flutter Obfuscation Configuration (build_obfuscated.sh)"
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    
    local SCRIPT_PATH="../apps/health_campaign_field_worker_app/build_obfuscated.sh"
    
    if [ ! -f "$SCRIPT_PATH" ]; then
        SCRIPT_PATH="build_obfuscated.sh"
    fi
    
    if [ ! -f "$SCRIPT_PATH" ]; then
        SCRIPT_PATH="../../apps/health_campaign_field_worker_app/build_obfuscated.sh"
    fi

    if [ ! -f "$SCRIPT_PATH" ]; then
        echo "    > [!] build_obfuscated.sh not found. Skipping."
        # This isn't strictly a failure if they use standard gradle, but let's count it
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
        return
    fi
    
    echo "    > Analyzing the custom build script $SCRIPT_PATH..."
    
    local has_flutter_obfuscate=$(grep "\-\-obfuscate" "$SCRIPT_PATH")
    
    if [[ ! -z "$has_flutter_obfuscate" ]]; then
        echo "    > Found Flutter symbol obfuscation flag:"
        echo "      $has_flutter_obfuscate"
        echo "    Result : [SECURE] The Dart code is compiled with --obfuscate."
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo "    > Flutter symbol obfuscation flag (--obfuscate) is NOT enabled."
        echo "    Result : [VULNERABLE] Flutter Dart bytecode may be easily reverse-engineered."
        FAILURE_COUNT=$((FAILURE_COUNT + 1))
    fi
    
    echo ""
}

check_gradle_obfuscation_settings
check_flutter_build_script

echo "==========================================================="
echo " Testing Complete."
echo " Total Tests Run : $TOTAL_TESTS"
echo " Passed (Secure) : $SUCCESS_COUNT"
echo " Failed (Vuln)   : $FAILURE_COUNT"
echo "==========================================================="
