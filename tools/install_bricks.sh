home="$PWD"

dart pub global activate mason_cli
dart pub global activate melos

melos run generate-hooks

mason add digit_entity --path ./mason_templates/digit_entity -g
mason add freezed_bloc --path ./mason_templates/freezed_bloc -g

cd apps/health_campaign_field_worker_app/lib || exit
app_root="$PWD"

cd models/model_configs || exit

for file in *.json ; do
  echo "$file"
  mason make digit_entity -c "$file" --on-conflict overwrite -o "$app_root"
done

cd "$home" || exit
echo "$PWD"

melos clean
melos bootstrap

cd tools || exit

# for adding attendance imports and mappers
bash attendance_package_imports.sh

# for adding inventory imports and mappers
bash inventory_package_imports.sh

# for adding digit scanner imports
bash digit_scanner_imports.sh

# for adding import as at.Address in sql_store.g.dart for resolving conflict with Address created inside sql_store.g.dart
cd ../apps/health_campaign_field_worker_app/lib/data/local_store/sql_store/ || exit

app_root="$PWD"

sql_g_dart_file="$app_root/sql_store.g.dart"

sed -i '0,/class \$AddressTable extends Address/s//class \$AddressTable extends at.Address/' sql_store.g.dart