#!/bin/bash

# Placeholder for script to run before apk generation
./tools/install_bricks.sh

# Placeholder for app directory path
APP_DIR="apps/health_campaign_field_worker_app"

# Ask user for environment to build for
echo "Please select an environment to build for (UAT, DEV, QA or ALL):"
read env
env=${env:-ALL}

# Ask user for build config
echo "Please select a build config (release or profile):"
read build_config
build_config=${build_config:-release}

# Build APK for specified environment(s) and build config
if [ "$env" == "ALL" ]; then
  env_list=("UAT" "QA" "DEV")
else
  env_list=("$env")
fi

for env_option in "${env_list[@]}"
do

  cd "$APP_DIR" || exit

  case $env_option in
    "UAT")
      cp ".env.uat" ".env"
      if [ "$build_config" == "release" ]; then
          flutter build apk --release
        elif [ "$build_config" == "profile" ]; then
          flutter build apk --profile
        else
          echo "Invalid build config selected."
          exit 1
        fi
      ;;
    "QA")
      cp ".env.qa" ".env"
      if [ "$build_config" == "release" ]; then
          flutter build apk --release
        elif [ "$build_config" == "profile" ]; then
          flutter build apk --profile
        else
          echo "Invalid build config selected."
          exit 1
        fi
      ;;
    "DEV")
      cp ".env.dev" ".env"
      if [ "$build_config" == "release" ]; then
          flutter build apk --release
        elif [ "$build_config" == "profile" ]; then
          flutter build apk --profile
        else
          echo "Invalid build config selected."
          exit 1
        fi
      ;;
  esac

  cd ../../ || exit

  mkdir -p outputs
  mv "$APP_DIR/build/app/outputs/flutter-apk/app-$build_config.apk" "outputs/app-$env_option-$build_config.apk"
done

echo "APK generation complete."