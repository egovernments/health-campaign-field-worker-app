import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_data_model/data/repositories/package_repository/local/hf_referral.dart';
import 'package:digit_data_model/data/repositories/package_repository/local/household.dart';
import 'package:digit_data_model/data/repositories/package_repository/local/household_member.dart';
import 'package:digit_data_model/data/repositories/package_repository/local/pgr_service.dart';
import 'package:digit_data_model/data/repositories/package_repository/local/project_beneficiary.dart';
import 'package:digit_data_model/data/repositories/package_repository/local/referral.dart';
import 'package:digit_data_model/data/repositories/package_repository/local/side_effect.dart';
import 'package:digit_data_model/data/repositories/package_repository/local/stock.dart';
import 'package:digit_data_model/data/repositories/package_repository/local/stock_reconciliation.dart';
import 'package:digit_data_model/data/repositories/package_repository/local/task.dart';
import 'package:digit_data_model/data/repositories/package_repository/oplog/oplog.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/hf_referral.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

import 'app_actions/app_actions.dart';

/// Stand-in for Isar, which cannot run in the browser. The web build of
/// digit_data_model keeps the oplog in memory and never touches this object;
/// it exists only because the oplog managers take an Isar in their
/// constructor.
class PreviewIsar implements Isar {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnsupportedError(
      'Isar is not available in the browser preview.');
}

/// Provides the same LocalRepository types the field worker app provides,
/// backed by the in-memory web database.
class PreviewRepositories extends StatelessWidget {
  final LocalSqlDataStore sql;
  final Widget child;

  const PreviewRepositories({super.key, required this.sql, required this.child});

  @override
  Widget build(BuildContext context) {
    final isar = PreviewIsar();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SearchEntityRepository>(
          create: (_) => SearchEntityRepository(sql, IndividualOpLogManager(isar)),
        ),
        RepositoryProvider<LocalRepository<HouseholdModel, HouseholdSearchModel>>(
          create: (_) => HouseholdLocalRepository(sql, HouseholdOpLogManager(isar)),
        ),
        RepositoryProvider<
            LocalRepository<IndividualModel, IndividualSearchModel>>(
          create: (_) =>
              IndividualLocalRepository(sql, IndividualOpLogManager(isar)),
        ),
        RepositoryProvider<
            LocalRepository<HouseholdMemberModel, HouseholdMemberSearchModel>>(
          create: (_) => HouseholdMemberLocalRepository(
              sql, HouseholdMemberOpLogManager(isar)),
        ),
        RepositoryProvider<
            LocalRepository<ProjectBeneficiaryModel,
                ProjectBeneficiarySearchModel>>(
          create: (_) => ProjectBeneficiaryLocalRepository(
              sql, ProjectBeneficiaryOpLogManager(isar)),
        ),
        RepositoryProvider<LocalRepository<TaskModel, TaskSearchModel>>(
          create: (_) => TaskLocalRepository(sql, TaskOpLogManager(isar)),
        ),
        RepositoryProvider<LocalRepository<SideEffectModel, SideEffectSearchModel>>(
          create: (_) =>
              SideEffectLocalRepository(sql, SideEffectOpLogManager(isar)),
        ),
        RepositoryProvider<LocalRepository<ReferralModel, ReferralSearchModel>>(
          create: (_) => ReferralLocalRepository(sql, ReferralOpLogManager(isar)),
        ),
        RepositoryProvider<LocalRepository<HFReferralModel, HFReferralSearchModel>>(
          create: (_) =>
              HFReferralLocalRepository(sql, HFReferralOpLogManager(isar)),
        ),
        RepositoryProvider<LocalRepository<StockModel, StockSearchModel>>(
          create: (_) => StockLocalRepository(sql, StockOpLogManager(isar)),
        ),
        RepositoryProvider<
            LocalRepository<StockReconciliationModel,
                StockReconciliationSearchModel>>(
          create: (_) => StockReconciliationLocalRepository(
              sql, StockReconciliationOpLogManager(isar)),
        ),
        RepositoryProvider<LocalRepository<PgrServiceModel, PgrServiceSearchModel>>(
          create: (_) =>
              PgrServiceLocalRepository(sql, PgrServiceOpLogManager(isar)),
        ),
        RepositoryProvider<
            LocalRepository<ProjectFacilityModel, ProjectFacilitySearchModel>>(
          create: (_) => ProjectFacilityLocalRepository(
              sql, ProjectFacilityOpLogManager(isar)),
        ),
        RepositoryProvider<
            LocalRepository<ProductVariantModel, ProductVariantSearchModel>>(
          create: (_) => ProductVariantLocalRepository(
              sql, ProductVariantOpLogManager(isar)),
        ),
        RepositoryProvider<LocalRepository<FacilityModel, FacilitySearchModel>>(
          create: (_) => FacilityLocalRepository(sql, FacilityOpLogManager(isar)),
        ),
        RepositoryProvider<
            LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel>>(
          create: (_) => idPoolRepository(sql, isar),
        ),
      ],
      child: child,
    );
  }
}

/// Search graph used by the registration module in the field worker app
/// (apps/health_campaign_field_worker_app/lib/pages/home.dart). The preview
/// uses it for every config so searches across linked records work.
List<RelationshipMapping> previewRelationships(BeneficiaryType type) => [
      const RelationshipMapping(
          from: 'name',
          to: 'individual',
          localKey: 'individualClientReferenceId',
          foreignKey: 'clientReferenceId'),
      const RelationshipMapping(
          from: 'identifier',
          to: 'individual',
          localKey: 'individualClientReferenceId',
          foreignKey: 'clientReferenceId'),
      const RelationshipMapping(
          from: 'householdMember',
          to: 'individual',
          localKey: 'individualClientReferenceId',
          foreignKey: 'clientReferenceId'),
      const RelationshipMapping(
          from: 'address',
          to: 'household',
          localKey: 'relatedClientReferenceId',
          foreignKey: 'clientReferenceId'),
      const RelationshipMapping(
          from: 'householdMember',
          to: 'household',
          localKey: 'householdClientReferenceId',
          foreignKey: 'clientReferenceId'),
      const RelationshipMapping(
          from: 'projectBeneficiary',
          to: 'task',
          localKey: 'clientReferenceId',
          foreignKey: 'projectBeneficiaryClientReferenceId'),
      const RelationshipMapping(
          from: 'identifier',
          to: 'hFReferral',
          localKey: 'identifierId',
          foreignKey: 'beneficiaryId'),
      if (type == BeneficiaryType.household)
        const RelationshipMapping(
          from: 'projectBeneficiary',
          to: 'household',
          localKey: 'beneficiaryClientReferenceId',
          foreignKey: 'clientReferenceId',
        )
      else
        const RelationshipMapping(
          from: 'projectBeneficiary',
          to: 'individual',
          localKey: 'beneficiaryClientReferenceId',
          foreignKey: 'clientReferenceId',
        ),
    ];

const List<NestedModelMapping> previewNestedMappings = [
  NestedModelMapping(
    rootModel: 'individual',
    fields: {
      'name': NestedFieldMapping(
        table: 'name',
        localKey: 'clientReferenceId',
        foreignKey: 'individualClientReferenceId',
        type: NestedMappingType.one,
      ),
      'address': NestedFieldMapping(
        table: 'address',
        localKey: 'clientReferenceId',
        foreignKey: 'relatedClientReferenceId',
        type: NestedMappingType.many,
      ),
      'identifiers': NestedFieldMapping(
        table: 'identifier',
        localKey: 'clientReferenceId',
        foreignKey: 'individualClientReferenceId',
        type: NestedMappingType.many,
      ),
    },
  ),
  NestedModelMapping(
    rootModel: 'household',
    fields: {
      'address': NestedFieldMapping(
        table: 'address',
        localKey: 'clientReferenceId',
        foreignKey: 'relatedClientReferenceId',
        type: NestedMappingType.one,
      ),
    },
  ),
];
