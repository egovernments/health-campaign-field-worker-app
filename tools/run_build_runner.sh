./tools/get_dependencies.sh
flutter packages run build_runner build --delete-conflicting-outputs

cd ./packages/digit_components || exit
flutter packages run build_runner build --delete-conflicting-outputs

cd ../forms_engine || exit
flutter packages run build_runner build --delete-conflicting-outputs