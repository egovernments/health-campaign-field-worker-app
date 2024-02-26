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

# for adding imports and mappers of attendance

cd apps/health_campaign_field_worker_app/lib || exit

app_root="$PWD"

data_model_file="$app_root/models/data_model.init.dart"

# Get the last number used in the import statements
last_num=$(grep -oP 'import .* as p\K\d+' "$data_model_file" | sort -nr | head -n 1)

# Increment the last number to get the starting number for our new imports
start_num=$((last_num + 1))

# Define the new imports
declare -A new_imports
new_imports=(
  ["attendance_audit.dart"]="AttendanceAuditDetailsMapper"
  ["attendance_log.dart"]="AttendanceLogModelMapper"
  ["attendance_register.dart"]="AttendanceRegisterModelMapper"
  ["attendee.dart"]="AttendeeModelMapper"
  ["staff.dart"]="StaffModelMapper"
)

# Create temporary files for imports and mappers
temp_imports=$(mktemp)
temp_mappers=$(mktemp)

# Loop through the new imports
for file in "${!new_imports[@]}"; do
  # Generate the import statement
  import="import 'package:attendance_management/models/$file' as p$start_num;"

  # Write the import statement to the temporary imports file
  echo "$import" >> "$temp_imports"

  # Generate the mapper initialization
  mapper="p$start_num.${new_imports[$file]}.ensureInitialized();"

  # Write the mapper initialization to the temporary mappers file
  echo "$mapper" >> "$temp_mappers"

  # Increment the number for the next import
  ((start_num++))
done

# Get the line number of the last import statement
last_import_line=$(grep -n 'import .* as p' "$data_model_file" | tail -n 1 | cut -d: -f1)

# Insert the import statements after the last import statement
sed -i ''"$last_import_line"'r '"$temp_imports" "$data_model_file"

# Get the line number of the last mapper initialization
last_mapper_line=$(grep -n '.*Mapper.ensureInitialized();' "$data_model_file" | tail -n 1 | cut -d: -f1)

# Insert the mapper initializations after the last mapper initialization
sed -i ''"$last_mapper_line"'r '"$temp_mappers" "$data_model_file"

# Remove the temporary files
rm "$temp_imports"
rm "$temp_mappers"


# for adding import as at.Address in sql_store.g.dart for resolving conflict with Address created inside sql_store.g.dart

cd data/local_store/sql_store/ || exit
app_root="$PWD"

sql_g_dart_file="$app_root/sql_store.g.dart"

sed -i '0,/class \$AddressTable extends Address/s//class \$AddressTable extends at.Address/' sql_store.g.dart