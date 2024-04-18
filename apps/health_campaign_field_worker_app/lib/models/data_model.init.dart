// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

import 'data_model.dart' as p0;
import 'entities/additional_fields_type.dart' as p1;
import 'entities/address.dart' as p2;
import 'entities/address_type.dart' as p3;
import 'entities/attributes.dart' as p4;
import 'entities/beneficiary_type.dart' as p5;
import 'entities/blood_group.dart' as p6;
import 'entities/boundary.dart' as p7;
import 'entities/deliver_strategy_type.dart' as p8;
import 'entities/document.dart' as p9;
import 'entities/downsync.dart' as p10;
import 'entities/facility.dart' as p11;
import 'entities/gender.dart' as p12;
import 'entities/h_f_referral.dart' as p13;
import 'entities/hcm_attendance_log_model.dart' as p14;
import 'entities/hcm_attendance_model.dart' as p15;
import 'entities/household.dart' as p16;
import 'entities/household_member.dart' as p17;
import 'entities/identifier.dart' as p18;
import 'entities/individual.dart' as p19;
import 'entities/locality.dart' as p20;
import 'entities/name.dart' as p21;
import 'entities/product.dart' as p22;
import 'entities/product_variant.dart' as p23;
import 'entities/project.dart' as p24;
import 'entities/project_beneficiary.dart' as p25;
import 'entities/project_facility.dart' as p26;
import 'entities/project_product_variant.dart' as p27;
import 'entities/project_resource.dart' as p28;
import 'entities/project_staff.dart' as p29;
import 'entities/project_type.dart' as p30;
import 'entities/referral.dart' as p31;
import 'entities/roles.dart' as p32;
import 'entities/roles_type.dart' as p33;
import 'entities/scanner_type.dart' as p34;
import 'entities/service.dart' as p35;
import 'entities/service_attributes.dart' as p36;
import 'entities/service_definition.dart' as p37;
import 'entities/side_effect.dart' as p38;
import 'entities/status.dart' as p39;
import 'entities/stock.dart' as p40;
import 'entities/stock_reconciliation.dart' as p41;
import 'entities/target.dart' as p42;
import 'entities/task.dart' as p43;
import 'entities/task_resource.dart' as p44;
import 'entities/transaction_reason.dart' as p45;
import 'entities/transaction_type.dart' as p46;
import 'entities/user.dart' as p47;
import 'oplog/oplog_entry.dart' as p48;
import 'pgr_complaints/pgr_address.dart' as p49;
import 'pgr_complaints/pgr_complaints.dart' as p50;
import 'pgr_complaints/pgr_complaints_response.dart' as p51;
import 'package:attendance_management/models/attendance_audit.dart' as p52;
import 'package:attendance_management/models/staff.dart' as p53;
import 'package:attendance_management/models/attendee.dart' as p54;
import 'package:attendance_management/models/attendance_log.dart' as p55;
import 'package:attendance_management/models/attendance_register.dart' as p56;

void initializeMappers() {
  p0.EntityModelMapper.ensureInitialized();
  p0.EntitySearchModelMapper.ensureInitialized();
  p0.AdditionalFieldsMapper.ensureInitialized();
  p0.AdditionalFieldMapper.ensureInitialized();
  p0.ClientAuditDetailsMapper.ensureInitialized();
  p0.AuditDetailsMapper.ensureInitialized();
  p1.AdditionalFieldsTypeMapper.ensureInitialized();
  p2.AddressSearchModelMapper.ensureInitialized();
  p2.AddressModelMapper.ensureInitialized();
  p2.AddressAdditionalFieldsMapper.ensureInitialized();
  p3.AddressTypeMapper.ensureInitialized();
  p4.AttributesSearchModelMapper.ensureInitialized();
  p4.AttributesModelMapper.ensureInitialized();
  p4.AttributesAdditionalFieldsMapper.ensureInitialized();
  p5.BeneficiaryTypeMapper.ensureInitialized();
  p6.BloodGroupMapper.ensureInitialized();
  p7.BoundarySearchModelMapper.ensureInitialized();
  p7.BoundaryModelMapper.ensureInitialized();
  p8.DeliverStrategyTypeMapper.ensureInitialized();
  p9.DocumentSearchModelMapper.ensureInitialized();
  p9.DocumentModelMapper.ensureInitialized();
  p9.DocumentAdditionalFieldsMapper.ensureInitialized();
  p10.DownsyncSearchModelMapper.ensureInitialized();
  p10.DownsyncModelMapper.ensureInitialized();
  p10.DownsyncAdditionalFieldsMapper.ensureInitialized();
  p11.FacilitySearchModelMapper.ensureInitialized();
  p11.FacilityModelMapper.ensureInitialized();
  p11.FacilityAdditionalFieldsMapper.ensureInitialized();
  p12.GenderMapper.ensureInitialized();
  p13.HFReferralSearchModelMapper.ensureInitialized();
  p13.HFReferralModelMapper.ensureInitialized();
  p13.HFReferralAdditionalFieldsMapper.ensureInitialized();
  p14.HCMAttendanceLogSearchModelMapper.ensureInitialized();
  p14.HCMAttendanceLogModelMapper.ensureInitialized();
  p15.HCMAttendanceSearchModelMapper.ensureInitialized();
  p15.HCMAttendanceRegisterModelMapper.ensureInitialized();
  p15.HCMAttendanceAdditionalModelMapper.ensureInitialized();
  p16.HouseholdSearchModelMapper.ensureInitialized();
  p16.HouseholdModelMapper.ensureInitialized();
  p16.HouseholdAdditionalFieldsMapper.ensureInitialized();
  p17.HouseholdMemberSearchModelMapper.ensureInitialized();
  p17.HouseholdMemberModelMapper.ensureInitialized();
  p17.HouseholdMemberAdditionalFieldsMapper.ensureInitialized();
  p18.IdentifierSearchModelMapper.ensureInitialized();
  p18.IdentifierModelMapper.ensureInitialized();
  p18.IdentifierAdditionalFieldsMapper.ensureInitialized();
  p19.IndividualSearchModelMapper.ensureInitialized();
  p19.IndividualModelMapper.ensureInitialized();
  p19.IndividualAdditionalFieldsMapper.ensureInitialized();
  p20.LocalitySearchModelMapper.ensureInitialized();
  p20.LocalityModelMapper.ensureInitialized();
  p20.LocalityAdditionalFieldsMapper.ensureInitialized();
  p21.NameSearchModelMapper.ensureInitialized();
  p21.NameModelMapper.ensureInitialized();
  p21.NameAdditionalFieldsMapper.ensureInitialized();
  p22.ProductSearchModelMapper.ensureInitialized();
  p22.ProductModelMapper.ensureInitialized();
  p22.ProductAdditionalFieldsMapper.ensureInitialized();
  p23.ProductVariantSearchModelMapper.ensureInitialized();
  p23.ProductVariantModelMapper.ensureInitialized();
  p23.ProductVariantAdditionalFieldsMapper.ensureInitialized();
  p24.ProjectSearchModelMapper.ensureInitialized();
  p24.ProjectModelMapper.ensureInitialized();
  p24.ProjectAdditionalFieldsMapper.ensureInitialized();
  p25.ProjectBeneficiarySearchModelMapper.ensureInitialized();
  p25.ProjectBeneficiaryModelMapper.ensureInitialized();
  p25.ProjectBeneficiaryAdditionalFieldsMapper.ensureInitialized();
  p26.ProjectFacilitySearchModelMapper.ensureInitialized();
  p26.ProjectFacilityModelMapper.ensureInitialized();
  p26.ProjectFacilityAdditionalFieldsMapper.ensureInitialized();
  p27.ProjectProductVariantSearchModelMapper.ensureInitialized();
  p27.ProjectProductVariantModelMapper.ensureInitialized();
  p27.ProjectProductVariantAdditionalFieldsMapper.ensureInitialized();
  p28.ProjectResourceSearchModelMapper.ensureInitialized();
  p28.ProjectResourceModelMapper.ensureInitialized();
  p28.ProjectResourceAdditionalFieldsMapper.ensureInitialized();
  p29.ProjectStaffSearchModelMapper.ensureInitialized();
  p29.ProjectStaffModelMapper.ensureInitialized();
  p29.ProjectStaffAdditionalFieldsMapper.ensureInitialized();
  p30.ProjectTypeSearchModelMapper.ensureInitialized();
  p30.ProjectTypeModelMapper.ensureInitialized();
  p30.ProjectTypeAdditionalFieldsMapper.ensureInitialized();
  p31.ReferralSearchModelMapper.ensureInitialized();
  p31.ReferralModelMapper.ensureInitialized();
  p31.ReferralAdditionalFieldsMapper.ensureInitialized();
  p32.RolesMapper.ensureInitialized();
  p33.RolesTypeMapper.ensureInitialized();
  p34.ScannerTypeMapper.ensureInitialized();
  p35.ServiceSearchModelMapper.ensureInitialized();
  p35.ServiceModelMapper.ensureInitialized();
  p35.ServiceAdditionalFieldsMapper.ensureInitialized();
  p36.ServiceAttributesSearchModelMapper.ensureInitialized();
  p36.ServiceAttributesModelMapper.ensureInitialized();
  p36.ServiceAttributesAdditionalFieldsMapper.ensureInitialized();
  p37.ServiceDefinitionSearchModelMapper.ensureInitialized();
  p37.ServiceDefinitionModelMapper.ensureInitialized();
  p37.ServiceDefinitionAdditionalFieldsMapper.ensureInitialized();
  p38.SideEffectSearchModelMapper.ensureInitialized();
  p38.SideEffectModelMapper.ensureInitialized();
  p38.SideEffectAdditionalFieldsMapper.ensureInitialized();
  p39.StatusMapper.ensureInitialized();
  p40.StockSearchModelMapper.ensureInitialized();
  p40.StockModelMapper.ensureInitialized();
  p40.StockAdditionalFieldsMapper.ensureInitialized();
  p41.StockReconciliationSearchModelMapper.ensureInitialized();
  p41.StockReconciliationModelMapper.ensureInitialized();
  p41.StockReconciliationAdditionalFieldsMapper.ensureInitialized();
  p42.TargetSearchModelMapper.ensureInitialized();
  p42.TargetModelMapper.ensureInitialized();
  p42.TargetAdditionalFieldsMapper.ensureInitialized();
  p43.TaskSearchModelMapper.ensureInitialized();
  p43.TaskModelMapper.ensureInitialized();
  p43.TaskAdditionalFieldsMapper.ensureInitialized();
  p44.TaskResourceSearchModelMapper.ensureInitialized();
  p44.TaskResourceModelMapper.ensureInitialized();
  p44.TaskResourceAdditionalFieldsMapper.ensureInitialized();
  p45.TransactionReasonMapper.ensureInitialized();
  p46.TransactionTypeMapper.ensureInitialized();
  p47.UserSearchModelMapper.ensureInitialized();
  p47.UserModelMapper.ensureInitialized();
  p47.UserAdditionalFieldsMapper.ensureInitialized();
  p48.OpLogEntryMapper.ensureInitialized();
  p48.AdditionalIdMapper.ensureInitialized();
  p48.DataOperationMapper.ensureInitialized();
  p48.ApiOperationMapper.ensureInitialized();
  p49.PgrAddressModelMapper.ensureInitialized();
  p49.GeoLocationMapper.ensureInitialized();
  p50.PgrComplaintModelMapper.ensureInitialized();
  p50.PgrComplainantModelMapper.ensureInitialized();
  p50.PgrRolesModelMapper.ensureInitialized();
  p50.PgrServiceSearchModelMapper.ensureInitialized();
  p50.PgrServiceModelMapper.ensureInitialized();
  p50.PgrWorkflowModelMapper.ensureInitialized();
  p50.PgrFiltersMapper.ensureInitialized();
  p50.PgrSearchKeysMapper.ensureInitialized();
  p50.PgrAdditionalDetailsMapper.ensureInitialized();
  p50.PgrServiceApplicationStatusMapper.ensureInitialized();
  p51.PgrServiceCreateResponseModelMapper.ensureInitialized();
  p51.PgrComplaintResponseModelMapper.ensureInitialized();
  p51.PgrComplainantResponseModelMapper.ensureInitialized();
  p51.PgrServiceResponseModelMapper.ensureInitialized();
p52.AttendanceAuditDetailsMapper.ensureInitialized();
p53.StaffModelMapper.ensureInitialized();
p54.AttendeeModelMapper.ensureInitialized();
p55.AttendanceLogModelMapper.ensureInitialized();
p56.AttendanceRegisterModelMapper.ensureInitialized();
}
