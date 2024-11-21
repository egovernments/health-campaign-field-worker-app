#!/bin/bash

APP_DIR="apps/health_campaign_field_worker_app"

# Function to build APK based on build config
build_apk() {
  if [ "$build_config" == "release" ]; then
    flutter build apk --release
  elif [ "$build_config" == "profile" ]; then
    flutter build apk -t lib/main_driver.dart --profile
  else
    echo "Invalid build config selected."
    exit 1
  fi
}

# Get environment and build config from GitHub Actions environment variables
build_config="${BUILD_CONFIG:-release}"

./tools/install_bricks.sh

  cd "$APP_DIR" || exit

  build_apk
  cd ../../ || exit

echo "APK generation complete."
