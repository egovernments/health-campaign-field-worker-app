cd apps/health_campaign_field_worker_app || exit

flutter pub run change_app_package_name:main org.egov.training.smc

rm -rf release-apk
mkdir release-apk

echo "Creating env configs"
echo "--------------------"
cp -fr .env-uat .env
echo

echo "Generating UAT APK"
echo "------------------"
flutter build apk
cp -fr build/app/outputs/flutter-apk/app-release.apk release-apk/apk-uat.apk
echo

open release-apk