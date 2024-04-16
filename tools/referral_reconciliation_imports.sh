# for adding imports and mappers of referral reconciliation

cd ../apps/health_campaign_field_worker_app/lib || exit

app_root="$PWD"

data_model_file="$app_root/models/data_model.init.dart"

# Get the last number used in the import statements
last_num=$(grep -oP 'import .* as p\K\d+' "$data_model_file" | sort -nr | head -n 1)

# Increment the last number to get the starting number for our new imports
start_num=$((last_num + 1))

# Define the new imports
declare -A new_imports
new_imports=(
  ["h_f_referral.dart"]="HFReferralModelMapper"
  ["referral_project_facility.dart"]="ReferralProjectFacilityModelMapper"
  ["referral_recon_attributes.dart"]="ReferralReconAttributesModelMapper"
  ["referral_recon_enums.dart"]="ReferralReconEnumsMapper"
  ["referral_recon_service.dart"]="ReferralReconServiceModelMapper"
  ["referral_recon_service_attributes.dart"]="ReferralReconServiceAttributesModelMapper"
  ["referral_recon_service_definition.dart"]="ReferralReconServiceDefinitionModelMapper"
)

# Create temporary files for imports and mappers
temp_imports=$(mktemp)
temp_mappers=$(mktemp)

# Loop through the new imports
for file in "${!new_imports[@]}"; do
  # Generate the import statement
  import="import 'package:referral_reconciliation/models/entities/$file' as p$start_num;"

  # Write the import statement to the temporary imports file
  echo "$import" >> "$temp_imports"

  # Generate the mapper initialization
  mapper="p$start_num.${new_imports[$file]}.ensureInitialized();"

  # Write the mapper initialization to the temporary mappers file
  echo "$mapper" >> "$temp_mappers"

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

# Adding localization delegates to the localization_delegates.dart file

#!/bin/bash

