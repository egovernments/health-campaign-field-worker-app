flutter clean
flutter packages get
flutter packages run build_runner build --delete-conflicting-outputs

cd ./packages/digit_components || exit
flutter clean
flutter packages get

cd ../forms_engine || exit
flutter clean
flutter packages get
flutter packages run build_runner build --delete-conflicting-outputs