home="$PWD"
#dart pub global activate mason_cli

mason add digit_entity --path ./mason_templates/digit_entity -g
mason add freezed_bloc --path ./mason_templates/freezed_bloc -g

cd apps/health_campaign_field_worker_app/lib || exit
app_root="$PWD"

cd models/model_configs || exit

for file in *.json ; do
  echo "$file"
  mason make digit_entity -c "$file" --on-conflict overwrite -o "$app_root"
done
#mason make digit_entity -c "enum_blood_group.json" --on-conflict overwrite -o "$app_root"

cd "$home" || exit
echo "$PWD"
#melos bootstrap
