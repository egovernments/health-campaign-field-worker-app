home="$PWD"

flutter pub global activate mason_cli
flutter pub global activate melos

melos.bat run generate-hooks

mason.bat add digit_entity --path ./mason_templates/digit_entity -g
mason.bat add freezed_bloc --path ./mason_templates/freezed_bloc -g

cd apps/health_campaign_field_worker_app/lib || exit
app_root="$PWD"

cd models/model_configs || exit

for file in *.json ; do
  echo "$file"
  mason.bat make digit_entity -c "$file" --on-conflict overwrite -o "$app_root"
done

cd "$home" || exit
echo "$PWD"

melos.bat clean
melos.bat bootstrap

cd tools || exit

# for adding attendance imports and mappers in data_model.init.dart
bash attendance_package_imports.sh

# for adding inventory imports and mappers in data_model.init.dart
bash inventory_package_imports.sh

# for adding referral reconciliation imports and mappers in data_model.init.dart
bash referral_reconciliation_imports.sh

# for adding import as at.Address in sql_store.g.dart for resolving conflict with Address created inside sql_store.g.dart
cd ../apps/health_campaign_field_worker_app/lib/data/local_store/sql_store/ || exit

app_root="$PWD"

sql_g_dart_file="$app_root/sql_store.g.dart"

sed -i '0,/class \$AddressTable extends Address/s//class \$AddressTable extends at.Address/' sql_store.g.dart

# To add localization and bloc skeleton and add repository imports to network_provider_wrapper file navigate to tools directory and run respective package_files.dart which ever you need