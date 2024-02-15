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