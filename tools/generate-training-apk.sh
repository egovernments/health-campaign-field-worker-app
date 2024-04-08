cd apps/health_campaign_field_worker_app || exit

flutter pub run change_app_package_name:main org.egov.training.lb

rm -rf release-apk
mkdir release-apk

echo "Creating env configs"
echo "--------------------"
cp -fr .env-training .env
echo

echo "Generating TRAINING APK"
echo "------------------"
flutter build apk
cp -fr build/app/outputs/flutter-apk/app-release.apk release-apk/apk-training.apk
echo

open release-apk