# for adding imports and mappers of attendance

cd ../apps/health_campaign_field_worker_app/lib || exit

app_root="$PWD"

# Adding localization delegates to the localization_delegates.dart file

# Define the path to the Dart file
dart_file_path="$app_root/utils/localization_delegates.dart"

# Define the import statement
import_statement="import 'package:digit_scanner/blocs/app_localization.dart' as scanner_localization;"

# Define the delegate
delegate="scanner_localization.ScannerLocalization.getDelegate(getLocalizationString(isar,selectedLocale,),appConfig.languages!,),"

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
if grep -Fq "$delegate" $dart_file_path
then
    echo "The delegate is already in the file."
else
    # If not, add it before the line containing the closing bracket of the list
    sed -i '/^[ \t]*]/i '"$delegate" $dart_file_path
    echo "The delegate was added."
fi