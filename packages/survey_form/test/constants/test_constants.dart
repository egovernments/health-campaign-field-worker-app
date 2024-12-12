import 'package:digit_data_model/data_model.dart';
import 'package:survey_form/models/entities/service.dart';
import 'package:survey_form/models/entities/service_attributes.dart';
import 'package:survey_form/models/entities/service_definition.dart';

class ServiceTestConstants {
  static const testTenantId = 'mz';
  static const testClientId = '170c46f0-5b95-11ef-8647-5ba267817823';
  static const testAccountId = 'a8e257fb-fa45-4488-b76c-7c2d2b70452c';
  static const testServiceDefId = '10a5342f-fe6b-4369-9197-7c871185d67d';
  static const testDataType = 'SingleValueList';

  static final mockServiceAttributesModel1 = ServiceAttributesModel(
    clientReferenceId: '170c46f1-5b95-11ef-8647-5ba267817823',
    referenceId: testClientId,
    tenantId: testTenantId,
    attributeCode: 'ATTR1',
    value: 'YES',
    dataType: testDataType,
  );

  static final mockServiceAttributesModel2 = ServiceAttributesModel(
    clientReferenceId: '170c46f2-5b95-11ef-8647-5ba267817823',
    referenceId: testClientId,
    tenantId: testTenantId,
    attributeCode: 'ATTR2',
    value: 'NO',
    dataType: testDataType,
    additionalDetails: {"value": "kmlkml"},
  );

  static final mockServiceModel = ServiceModel(
    clientId: testClientId,
    serviceDefId: testServiceDefId,
    isActive: true,
    accountId: testAccountId,
    additionalDetails: {'locality': 'ADMIN_MO_06_05_03_01_04_SHERRIKEN'},
    createdAt: DateTime.utc(2024, 8, 16).toString(),
    tenantId: testTenantId,
    attributes: [mockServiceAttributesModel1, mockServiceAttributesModel2],
  );

  static final mockAttributesModel1 = AttributesModel(
    tenantId: testTenantId,
    code: "ATTR1",
    dataType: testDataType,
    values: null,
    required: true,
    isActive: true,
    regex: null,
    order: 1,
  );

  static final mockAttributesModel2 = AttributesModel(
    tenantId: testTenantId,
    code: "ATTR2",
    dataType: testDataType,
    values: null,
    required: true,
    isActive: true,
    regex: null,
    order: 1,
  );

  static final mockServiceDefinitionModel = ServiceDefinitionModel(
    id: testServiceDefId,
    tenantId: testTenantId,
    code: 'HEALTH',
    isActive: true,
    attributes: [mockAttributesModel1, mockAttributesModel2],
  );

  static final mockServiceSearchModel = ServiceSearchModel(
    clientId: testClientId,
    tenantId: testTenantId,
  );

  static final mockServiceDefinitionSearchModel = ServiceDefinitionSearchModel(
    id: testServiceDefId,
    tenantId: testTenantId,
    code: ['HEALTH'],
  );
}
