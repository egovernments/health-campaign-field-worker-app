# for adding imports and mappers of attendance

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

# Define the path to the Dart file
dart_file_path="$app_root/utils/localization_delegates.dart"

# Define the import statement
import_statement="import 'package:attendance_management/blocs/app_localization.dart' as attendance_localization;"

# Define the delegate
delegate="attendance_localization.AttendanceLocalization.getDelegate(getLocalizationString(isar,selectedLocale,),appConfig.languages!,),"

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

# Get the current directory
appDirectory=$(pwd)

# Define the bloc directory
blocDirectory="$appDirectory/blocs/attendance"

# Ensure the directory exists
mkdir -p $blocDirectory

# Define the file path
filePath="$blocDirectory/hcm_attendance_bloc.dart"

# Check if the file already exists
if [ -f "$filePath" ]; then
    echo "File $filePath already exists. Not modifying the content."
else
    # Write the class definition to the file
    cat > $filePath << EOF
import 'package:attendance_management/blocs/attendance_listeners.dart';
import 'package:attendance_management/models/attendance_log.dart';
import 'package:attendance_management/models/attendance_register.dart';

class HcmAttendanceBloc extends AttendanceListeners {
  @override
  void callSyncMethod() {
    // TODO: implement callSyncMethod
  }

  @override
  Future<List<AttendanceRegisterModel>> getAttendanceRegisters() {
    // TODO: implement getAttendanceRegisters
    throw UnimplementedError();
  }

  @override
  Future<List<AttendanceLogModel>> searchAttendanceLog({required String registerId, required String tenantId, required int entryTime, required int exitTime, required int currentDate}) {
    // TODO: implement searchAttendanceLog
    throw UnimplementedError();
  }

  @override
  void submitAttendanceDetails(SubmitAttendanceDetails attendanceLogs) {
    // TODO: implement submitAttendanceDetails
  }
}
EOF
    echo "File $filePath created."
fi