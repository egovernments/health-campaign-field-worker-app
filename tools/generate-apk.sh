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

# # Ask user for environment to build for
# echo "Please select an environment to build for (UAT, DEV, QA or ALL):"
# read env
# env="${env:-ALL}"

# Ask user for build config
echo "Please select a build config (release or profile):"
read build_config
build_config="${build_config:-release}"

# # Build APK for specified environment(s) and build config
# if [ "$env" == "ALL" ]; then
#   env_list=("UAT" "DEV" "QA")
# else
#   env_list=("$env")
# fi

#./tools/install_bricks.sh

cd "$APP_DIR" || exit

# for env_option in "${env_list[@]}"; do
#   cd "$APP_DIR" || exit

#   case $env_option in
#   "UAT")
#     cp ".env.uat" ".env"
#     ;;
#   "QA")
#     cp ".env.qa" ".env"
#     ;;
#   "DEV")
#     cp ".env.dev" ".env"
#     ;;
#   esac

  build_apk
  cd ../../ || exit

  # mkdir -p outputs
  # mv "$APP_DIR/build/app/outputs/apk/release/app-$build_config.apk" "outputs/app-$env_option-$build_config.apk"
# done

# open outputs
echo "APK generation complete."
