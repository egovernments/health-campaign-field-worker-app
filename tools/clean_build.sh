home="$PWD"

cd apps/health_campaign_field_worker_app/ios || exit

pod deintegrate
Pod install
Pod repo update

cd ..

flutter clean
flutter pub cache repair
flutter pub get

cd "$home" || exit

melos clean
melos bootstrap

