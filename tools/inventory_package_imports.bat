Set-Location -Path "..\apps\health_campaign_field_worker_app\lib"

$app_root = Get-Location

$data_model_file = Join-Path -Path $app_root -ChildPath "models\data_model.init.dart"

# Get the last number used in the import statements
$last_num = Select-String -Path $data_model_file -Pattern 'import .* as p(\d+)' | ForEach-Object { [int]$_.Matches.Groups[1].Value } | Sort-Object -Descending | Select-Object -First 1

# Increment the last number to get the starting number for our new imports
$start_num = $last_num + 1

# Define the new imports
$new_imports = @{
  "inventory_facility.dart" = "InventoryFacilityModelMapper"
  "product_variant.dart" = "ProductVariantModelMapper"
  "project_product_variant.dart" = "ProjectProductVariantModelMapper"
  "stock.dart" = "StockModelMapper"
  "stock_reconciliation.dart" = "StockReconciliationModelMapper"
  "transaction_reason.dart" = "TransactionReasonMapper"
  "transaction_type.dart" = "TransactionTypeMapper"
}

# Create temporary files for imports and mappers
$temp_imports = New-TemporaryFile
$temp_mappers = New-TemporaryFile

# Loop through the new imports
foreach ($file in $new_imports.Keys) {
  # Generate the import statement
  $import = "import 'package:inventory_management/models/entities/$file' as p$start_num;"

  # Write the import statement to the temporary imports file
  Add-Content -Path $temp_imports.FullName -Value $import

  # Generate the mapper initialization
  $mapper = "p$start_num.$($new_imports[$file]).ensureInitialized();"

  # Write the mapper initialization to the temporary mappers file
  Add-Content -Path $temp_mappers.FullName -Value $mapper

  $start_num++
}

# Get the line number of the last import statement
$last_import_line = Select-String -Path $data_model_file -Pattern 'import .* as p' | Select-Object -Last 1 | ForEach-Object { $_.LineNumber }

# Insert the import statements after the last import statement
(Get-Content -Path $data_model_file) | ForEach-Object {
  if ($_.ReadCount -eq $last_import_line) {
    $_
    Get-Content -Path $temp_imports.FullName
  } else {
    $_
  }
} | Set-Content -Path $data_model_file

# Get the line number of the last mapper initialization
$last_mapper_line = Select-String -Path $data_model_file -Pattern '.*Mapper.ensureInitialized();' | Select-Object -Last 1 | ForEach-Object { $_.LineNumber }

# Insert the mapper initializations after the last mapper initialization
(Get-Content -Path $data_model_file) | ForEach-Object {
  if ($_.ReadCount -eq $last_mapper_line) {
    $_
    Get-Content -Path $temp_mappers.FullName
  } else {
    $_
  }
} | Set-Content -Path $data_model_file

# Remove the temporary files
Remove-Item -Path $temp_imports.FullName
Remove-Item -Path $temp_mappers.FullName

# Adding localization delegates to the localization_delegates.dart file

# Define the path to the Dart file
$dart_file_path = Join-Path -Path $app_root -ChildPath "utils\localization_delegates.dart"

# Define the import statement
$import_statement = "import 'package:inventory_management/blocs/app_localization.dart' as inventory_localization;"

# Define the delegate
$delegate = "inventory_localization.InventoryLocalization.getDelegate(getLocalizationString(isar,selectedLocale,),appConfig.languages!,),"

# Convert the delegate string into a single line string
$delegate_single_line = $delegate -replace "`n", ""

# Check if the import statement is in the file
if (Select-String -Path $dart_file_path -Pattern [regex]::Escape($import_statement)) {
  Write-Output "The import statement is already in the file."
} else {
  # If not, add it at the top of the file
  $content = Get-Content -Path $dart_file_path
  $content = $import_statement, $content
  Set-Content -Path $dart_file_path -Value $content
  Write-Output "The import statement was added."
}

# Check if the delegate is in the file
if (Select-String -Path $dart_file_path -Pattern [regex]::Escape($delegate_single_line)) {
  Write-Output "The delegate is already in the file."
} else {
  # If not, add it before the line containing the closing bracket of the list
  $content = Get-Content -Path $dart_file_path
  $index = $content.IndexOf(']')
  $content = $content[0..($index-1)] + $delegate + $content[$index..$content.Length]
  Set-Content -Path $dart_file_path -Value $content
  Write-Output "The delegate was added."
}

# Adding the skeleton of the HcmInventoryBloc class extension to the inventory listener

# Define the bloc directory
$blocDirectory = Join-Path -Path $app_root -ChildPath "blocs\inventory"

# Ensure the directory exists
if (!(Test-Path -Path $blocDirectory)) {
  New-Item -ItemType Directory -Path $blocDirectory | Out-Null
}

# Define the file path
$filePath = Join-Path -Path $blocDirectory -ChildPath "hcm_inventory_bloc.dart"

# Check if the file already exists
if (Test-Path -Path $filePath) {
  Write-Output "File $filePath already exists. Not modifying the content."
} else {
  # Write the class definition to the file
  @"
import 'package:inventory_management/blocs/inventory_report.dart';
import 'package:inventory_management/inventory_management.dart';

class HcmInventoryBloc extends InventoryListener {
  @override
  void callSyncMethod() {
    // TODO: implement callSyncMethod
  }

  @override
  Future<List<InventoryFacilityModel>> fetchFacilitiesForProjectId() {
    // TODO: implement fetchFacilitiesForProjectId
    throw UnimplementedError();
  }

  @override
  Future<Map<String, List<StockModel>>> fetchInventoryReports({InventoryReportType? reportType, String? facilityId, String? productVariantId}) {
    // TODO: implement fetchInventoryReports
    throw UnimplementedError();
  }

  @override
  Future<List<ProductVariantModel>> fetchProductVariants() {
    // TODO: implement fetchProductVariants
    throw UnimplementedError();
  }

  @override
  Future<List<List<StockModel>>> fetchStockReconciliationDetails({String? productVariantId, String? facilityId}) {
    // TODO: implement fetchStockReconciliationDetails
    throw UnimplementedError();
  }

  @override
  Future<StockReconciliationReport> handleStockReconciliationReport({String? facilityId, String? productVariantId}) {
    // TODO: implement handleStockReconciliationReport
    throw UnimplementedError();
  }

  @override
  Future<bool> saveStockDetails(SaveStockDetails saveStockDetails) {
    // TODO: implement saveStockDetails
    throw UnimplementedError();
  }

  @override
  Future<bool> saveStockReconciliationDetails(SaveStockReconciliationModel stockReconciliationModel) {
    // TODO: implement saveStockReconciliationDetails
    throw UnimplementedError();
  }
}
"@ | Out-File -FilePath $filePath
  Write-Output "File $filePath created."
}