// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

import 'data_model.dart' as p0;
import 'models/entities/address.dart' as p1;
import 'models/entities/address_type.dart' as p2;
import 'models/entities/attributes.dart' as p3;
import 'models/entities/beneficiary_type.dart' as p4;
import 'models/entities/blood_group.dart' as p5;
import 'models/entities/boundary.dart' as p6;
import 'models/entities/document.dart' as p7;
import 'models/entities/facility.dart' as p8;
import 'models/entities/gender.dart' as p9;
import 'models/entities/identifier.dart' as p10;
import 'models/entities/individual.dart' as p11;
import 'models/entities/locality.dart' as p12;
import 'models/entities/name.dart' as p13;
import 'models/entities/pgr_application_status.dart' as p14;
import 'models/entities/product.dart' as p15;
import 'models/entities/product_variant.dart' as p16;
import 'models/entities/project.dart' as p17;
import 'models/entities/project_facility.dart' as p18;
import 'models/entities/project_product_variant.dart' as p19;
import 'models/entities/project_resource.dart' as p20;
import 'models/entities/project_staff.dart' as p21;
import 'models/entities/project_type.dart' as p22;
import 'models/entities/target.dart' as p23;
import 'models/entities/user.dart' as p24;
import 'models/entities/user_action.dart' as p25;
import 'models/oplog/oplog_entry.dart' as p26;

void initializeMappers() {
  p0.EntityModelMapper.ensureInitialized();
  p0.EntitySearchModelMapper.ensureInitialized();
  p0.AdditionalFieldsMapper.ensureInitialized();
  p0.AdditionalFieldMapper.ensureInitialized();
  p0.ClientAuditDetailsMapper.ensureInitialized();
  p0.AuditDetailsMapper.ensureInitialized();
  p1.AddressSearchModelMapper.ensureInitialized();
  p1.AddressModelMapper.ensureInitialized();
  p1.AddressAdditionalFieldsMapper.ensureInitialized();
  p2.AddressTypeMapper.ensureInitialized();
  p3.AttributesSearchModelMapper.ensureInitialized();
  p3.AttributesModelMapper.ensureInitialized();
  p3.AttributesAdditionalFieldsMapper.ensureInitialized();
  p4.BeneficiaryTypeMapper.ensureInitialized();
  p5.BloodGroupMapper.ensureInitialized();
  p6.BoundarySearchModelMapper.ensureInitialized();
  p6.BoundaryModelMapper.ensureInitialized();
  p7.DocumentSearchModelMapper.ensureInitialized();
  p7.DocumentModelMapper.ensureInitialized();
  p7.DocumentAdditionalFieldsMapper.ensureInitialized();
  p8.FacilitySearchModelMapper.ensureInitialized();
  p8.FacilityModelMapper.ensureInitialized();
  p8.FacilityAdditionalFieldsMapper.ensureInitialized();
  p9.GenderMapper.ensureInitialized();
  p10.IdentifierSearchModelMapper.ensureInitialized();
  p10.IdentifierModelMapper.ensureInitialized();
  p10.IdentifierAdditionalFieldsMapper.ensureInitialized();
  p11.IndividualSearchModelMapper.ensureInitialized();
  p11.IndividualModelMapper.ensureInitialized();
  p11.IndividualAdditionalFieldsMapper.ensureInitialized();
  p12.LocalitySearchModelMapper.ensureInitialized();
  p12.LocalityModelMapper.ensureInitialized();
  p12.LocalityAdditionalFieldsMapper.ensureInitialized();
  p13.NameSearchModelMapper.ensureInitialized();
  p13.NameModelMapper.ensureInitialized();
  p13.NameAdditionalFieldsMapper.ensureInitialized();
  p14.PgrServiceApplicationStatusMapper.ensureInitialized();
  p15.ProductSearchModelMapper.ensureInitialized();
  p15.ProductModelMapper.ensureInitialized();
  p15.ProductAdditionalFieldsMapper.ensureInitialized();
  p16.ProductVariantSearchModelMapper.ensureInitialized();
  p16.ProductVariantModelMapper.ensureInitialized();
  p16.ProductVariantAdditionalFieldsMapper.ensureInitialized();
  p17.ProjectSearchModelMapper.ensureInitialized();
  p17.ProjectModelMapper.ensureInitialized();
  p17.ProjectAdditionalFieldsMapper.ensureInitialized();
  p17.ProjectAdditionalDetailsMapper.ensureInitialized();
  p18.ProjectFacilitySearchModelMapper.ensureInitialized();
  p18.ProjectFacilityModelMapper.ensureInitialized();
  p18.ProjectFacilityAdditionalFieldsMapper.ensureInitialized();
  p19.ProjectProductVariantSearchModelMapper.ensureInitialized();
  p19.ProjectProductVariantModelMapper.ensureInitialized();
  p19.ProjectProductVariantAdditionalFieldsMapper.ensureInitialized();
  p20.ProjectResourceSearchModelMapper.ensureInitialized();
  p20.ProjectResourceModelMapper.ensureInitialized();
  p20.ProjectResourceAdditionalFieldsMapper.ensureInitialized();
  p21.ProjectStaffSearchModelMapper.ensureInitialized();
  p21.ProjectStaffModelMapper.ensureInitialized();
  p21.ProjectStaffAdditionalFieldsMapper.ensureInitialized();
  p22.ProjectTypeModelMapper.ensureInitialized();
  p22.ProjectTypeAdditionalFieldsMapper.ensureInitialized();
  p22.ProjectCycleMapper.ensureInitialized();
  p22.ProjectCycleDeliveryMapper.ensureInitialized();
  p22.DeliveryDoseCriteriaMapper.ensureInitialized();
  p22.DeliveryProductVariantMapper.ensureInitialized();
  p23.TargetSearchModelMapper.ensureInitialized();
  p23.TargetModelMapper.ensureInitialized();
  p23.TargetAdditionalFieldsMapper.ensureInitialized();
  p24.UserSearchModelMapper.ensureInitialized();
  p24.UserModelMapper.ensureInitialized();
  p24.UserAdditionalFieldsMapper.ensureInitialized();
  p25.UserActionSearchModelMapper.ensureInitialized();
  p25.UserActionModelMapper.ensureInitialized();
  p25.UserActionAdditionalFieldsMapper.ensureInitialized();
  p26.OpLogEntryMapper.ensureInitialized();
  p26.AdditionalIdMapper.ensureInitialized();
  p26.DataOperationMapper.ensureInitialized();
  p26.ApiOperationMapper.ensureInitialized();
}
