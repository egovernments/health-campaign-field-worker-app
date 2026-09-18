#!/bin/bash

# Build Obfuscated Release APK/App Bundle
# This script builds a production-ready, obfuscated version of the app

set -e

echo "=========================================="
echo "Building Obfuscated Release"
echo "=========================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
BUILD_TYPE=${1:-apk}  # apk or appbundle
OBFUSCATE=${OBFUSCATE:-true}
SPLIT_DEBUG_INFO="build/app/outputs/symbols"

# Validate build type
if [[ "$BUILD_TYPE" != "apk" && "$BUILD_TYPE" != "appbundle" ]]; then
    echo -e "${RED}Error: Build type must be 'apk' or 'appbundle'${NC}"
    echo "Usage: ./build_obfuscated.sh [apk|appbundle]"
    exit 1
fi

# Check if running from correct directory
if [ ! -f "pubspec.yaml" ]; then
    echo -e "${RED}Error: Must run from app root directory${NC}"
    exit 1
fi

# Check if key.properties exists
if [ ! -f "android/key.properties" ]; then
    echo -e "${YELLOW}Warning: android/key.properties not found${NC}"
    echo -e "${YELLOW}Make sure you have configured signing for release builds${NC}"
fi

echo -e "${GREEN}Step 1: Cleaning previous builds...${NC}"
fvm flutter clean
rm -rf build/

echo -e "${GREEN}Step 2: Getting dependencies...${NC}"
fvm flutter pub get

echo -e "${GREEN}Step 3: Running code generation...${NC}"
fvm flutter pub run build_runner build --delete-conflicting-outputs

echo -e "${GREEN}Step 4: Building release with obfuscation...${NC}"

# Create directory for debug symbols
mkdir -p "$SPLIT_DEBUG_INFO"

if [ "$BUILD_TYPE" == "apk" ]; then
    echo -e "${GREEN}Building obfuscated APK...${NC}"
    fvm flutter build apk \
        --release \
        --obfuscate \
        --split-debug-info="$SPLIT_DEBUG_INFO" \
        --target-platform android-arm,android-arm64,android-x64
    
    OUTPUT_FILE="build/app/outputs/flutter-apk/app-release.apk"
    
elif [ "$BUILD_TYPE" == "appbundle" ]; then
    echo -e "${GREEN}Building obfuscated App Bundle...${NC}"
    fvm flutter build appbundle \
        --release \
        --obfuscate \
        --split-debug-info="$SPLIT_DEBUG_INFO"
    
    OUTPUT_FILE="build/app/outputs/bundle/release/app-release.aab"
fi

echo ""
echo -e "${GREEN}=========================================="
echo "Build Completed Successfully!"
echo "==========================================${NC}"
echo ""
echo "Output file: $OUTPUT_FILE"
echo "Debug symbols: $SPLIT_DEBUG_INFO"
echo ""

# Get file size
if [ -f "$OUTPUT_FILE" ]; then
    FILE_SIZE=$(du -h "$OUTPUT_FILE" | cut -f1)
    echo "File size: $FILE_SIZE"
    
    # Show file info
    echo ""
    echo "File details:"
    ls -lh "$OUTPUT_FILE"
fi

echo ""
echo -e "${YELLOW}Important Notes:${NC}"
echo "1. The app is obfuscated to prevent reverse engineering"
echo "2. Debug symbols are saved in: $SPLIT_DEBUG_INFO"
echo "3. Keep debug symbols for crash reporting (Firebase Crashlytics)"
echo "4. Test the obfuscated build thoroughly before release"
echo ""

# Android-specific notes
if [ "$BUILD_TYPE" == "appbundle" ]; then
    echo -e "${GREEN}App Bundle Notes:${NC}"
    echo "- Upload to Google Play Console for distribution"
    echo "- Google Play will generate optimized APKs for different devices"
fi

echo ""
echo -e "${GREEN}Security Features Enabled:${NC}"
echo "✓ Code obfuscation with R8"
echo "✓ Resource shrinking"
echo "✓ ProGuard rules applied"
echo "✓ Debug information removed"
echo "✓ fvm flutter symbol obfuscation"
echo ""

echo -e "${YELLOW}Next Steps:${NC}"
echo "1. Test the build on multiple devices"
echo "2. Verify all features work correctly"
echo "3. Upload debug symbols to crash reporting service"
echo "4. Upload to Google Play Console (for App Bundle)"
echo ""
