# for adding imports and mappers of inventory

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
  ["inventory_facility.dart"]="InventoryFacilityModelMapper"
  ["product_variant.dart"]="ProductVariantModelMapper"
  ["project_product_variant.dart"]="ProjectProductVariantModelMapper"
  ["stock.dart"]="StockModelMapper"
  ["stock_reconciliation.dart"]="StockReconciliationModelMapper"
  ["transaction_reason.dart"]="TransactionReasonMapper"
  ["transaction_type.dart"]="TransactionTypeMapper"
)

# Create temporary files for imports and mappers
temp_imports=$(mktemp)
temp_mappers=$(mktemp)

# Loop through the new imports
for file in "${!new_imports[@]}"; do
  # Generate the import statement
  import="import 'package:inventory_management/models/entities/$file' as p$start_num;"

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

# Define the path to the Dart file
dart_file_path="$app_root/utils/localization_delegates.dart"

# Define the import statement
import_statement="import 'package:inventory_management/blocs/app_localization.dart' as inventory_localization;"

# Define the delegate
delegate="inventory_localization.InventoryLocalization.getDelegate(getLocalizationString(isar,selectedLocale,),appConfig.languages!,),"

# Convert the delegate string into a single line string
delegate_single_line=$(echo "$delegate" | tr -d '\n')

# Check if the import statement is in the file
if grep -Fq "$import_statement" $dart_file_path
then
    echo "The import statement is already in the file."
else
    # If not, add it at the top of the file
    echo -e "$import_statement\n$(cat $dart_file_path)" > $dart_file_path
    echo "The import statement was added."
fi

# Check if the delegate is in the file
if grep -Fq "$delegate_single_line" $dart_file_path
then
    echo "The delegate is already in the file."
else
    # If not, add it before the line containing the closing bracket of the list
    sed -i '/^[ \t]*]/i '"$delegate" $dart_file_path
    echo "The delegate was added."
fi