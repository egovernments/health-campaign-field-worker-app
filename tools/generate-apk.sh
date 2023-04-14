#!/bin/bash

# Define variables
APP_DIR="apps/health_campaign_field_worker_app"
RELEASE_DIR="release-apk"
QA_ENV_FILE=".env.qa"
UAT_ENV_FILE=".env.uat"
APK_MODE="release"
ENVIRONMENTS=()

# Ask if user wants to generate APKs for all environments
echo "Do you want to generate APKs for all environments in release mode? (y/n)"
read -r AUTO_GENERATE
if [[ "$AUTO_GENERATE" == "y" ]]; then
    ENVIRONMENTS=("qa" "uat")
else
    # Ask which environments to generate APKs for
    while true; do
        echo "Which environments do you want to generate APKs for? (Enter 'qa', 'uat', or 'done' to finish)"
        read -r ENV
        if [[ "$ENV" == "qa" || "$ENV" == "uat" ]]; then
            ENVIRONMENTS+=("$ENV")
        elif [[ "$ENV" == "done" ]]; then
            break
        else
            echo "Error: Invalid environment specified"
        fi
    done

    # Ask which APK mode to generate
    echo "Which APK mode do you want to generate? (Enter 1 for Release, 2 for Profile)"
    read -r APK_MODE_OPTION
    if [[ "$APK_MODE_OPTION" == "2" ]]; then
        APK_MODE="profile"
    fi
fi

# Install dependencies
echo "Installing bricks"
echo "-----------------"
./tools/install_bricks.sh
echo

# Navigate to app directory
cd "$APP_DIR" || exit

# Function to generate APKs for a specific environment
generate_apk() {
    # Set environment file
    if [ "$1" == "qa" ]; then
        ENV_FILE="$QA_ENV_FILE"
    elif [ "$1" == "uat" ]; then
        ENV_FILE="$UAT_ENV_FILE"
    else
        echo "Error: Invalid environment specified"
        exit 1
    fi

    # Copy environment file
    echo "Creating env configs"
    echo "--------------------"
    cp -fr "$ENV_FILE" .env || { echo "Error: Unable to copy environment file"; exit 1; }
    echo

    # Generate APK
    echo "Generating $1 APK"
    echo "-----------------"
    flutter build apk --$APK_MODE || { echo "Error: Unable to generate APK"; exit 1; }
    echo

    # Copy APK to release folder
    echo "Copying APK to release folder"
    echo "----------------------------"
    cp -fr "build/app/outputs/flutter-apk/app-release.apk" "$RELEASE_DIR/apk-$1.apk" || { echo "Error: Unable to copy APK"; exit 1; }
    echo
}

# Create release folder
echo "Creating release folder"
echo "-----------------------"
mkdir -p "$RELEASE_DIR" || { echo "Error: Unable to create release folder"; exit 1; }
echo

# Generate APKs for selected environments
for ENVIRONMENT in "${ENVIRONMENTS[@]}"; do
    yes | head -n 1 | generate_apk "$ENVIRONMENT"
done

# Open release folder
echo "Opening release folder"
echo "----------------------"
open "$RELEASE_DIR"
