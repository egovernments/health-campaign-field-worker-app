// GENERATED using mason_cli
import 'dart:async';

import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/utils/typedefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:registration_delivery/models/entities/household_member.dart';
import 'package:registration_delivery/models/entities/id_status.dart';
import 'package:registration_delivery/models/entities/task.dart';
import 'package:survey_form/models/entities/service.dart';

import '../../models/entities/household.dart';
import '../../models/entities/household_member_relationship.dart';
import '../../models/entities/project_beneficiary.dart';
import '../../models/entities/status.dart';
import '../../models/entities/unique_id_pool.dart';
import '../../utils/typedefs.dart';
import '../../utils/utils.dart';

part 'beneficiary_registration.freezed.dart';

typedef BeneficiaryRegistrationEmitter = Emitter<BeneficiaryRegistrationState>;

//This bloc is used for registration of Beneficiaries to the project
class BeneficiaryRegistrationBloc
    extends Bloc<BeneficiaryRegistrationEvent, BeneficiaryRegistrationState> {
  final IndividualDataRepository individualRepository;

  final HouseholdDataRepository householdRepository;

  final HouseholdMemberDataRepository householdMemberRepository;

  final ProjectBeneficiaryDataRepository projectBeneficiaryRepository;

  final TaskDataRepository taskDataRepository;

  final BeneficiaryType beneficiaryType;

  final LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel>
      uniqueIdPoolLocalRepository;

  BeneficiaryRegistrationBloc(
    super.initialState, {
    required this.individualRepository,
    required this.householdRepository,
    required this.householdMemberRepository,
    required this.projectBeneficiaryRepository,
    required this.taskDataRepository,
    required this.beneficiaryType,
    required this.uniqueIdPoolLocalRepository,
  }) {
    on(_handleSaveAddress);
    on(_handleSaveHouseDetails);
    on(_handleSaveHouseholdDetails);
    on(_handleSaveIndividualDetails);
    on(_handleCreate);
    on(_handleUpdateHousehold);
    on(_handleUpdateIndividual);
    on(_handleAddMember);
    on(_handleSummary);
  }

  //_handleSaveAddress event can be used for saving address details to the form
  FutureOr<void> _handleSaveAddress(
    BeneficiaryRegistrationSaveAddressEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    state.maybeMap(
      orElse: () {
        throw const InvalidRegistrationStateException();
      },
      editHousehold: (value) {
        emit(value.copyWith(addressModel: event.model));
      },
      create: (value) {
        emit(value.copyWith(addressModel: event.model));
      },
    );
  }

  //_handleSaveHouseDetails event can be used for saving house details to the form
  FutureOr<void> _handleSaveHouseDetails(
    BeneficiaryRegistrationSaveHouseDetailsEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    state.maybeMap(
      orElse: () {
        throw const InvalidRegistrationStateException();
      },
      editHousehold: (value) {
        emit(value.copyWith(householdModel: event.model));
      },
      create: (value) {
        emit(value.copyWith(householdModel: event.model));
      },
    );
  }

  FutureOr<void> _handleSaveHouseholdDetails(
    BeneficiaryRegistrationSaveHouseholdDetailsEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    state.maybeMap(
      orElse: () {
        throw const InvalidRegistrationStateException();
      },
      editHousehold: (value) {
        emit(value.copyWith(
          householdModel: event.household,
        ));
      },
      create: (value) {
        emit(value.copyWith(
          householdModel: event.household,
          registrationDate: event.registrationDate,
        ));
      },
      summary: (value) {
        emit(value.copyWith(
          householdModel: event.household,
          registrationDate: event.registrationDate,
        ));
      },
    );
  }

  FutureOr<void> _handleSaveIndividualDetails(
    BeneficiaryRegistrationSaveIndividualDetailsEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    state.maybeMap(
      orElse: () {
        throw const InvalidRegistrationStateException();
      },
      create: (value) {
        emit(value.copyWith(
          isHeadOfHousehold: event.isHeadOfHousehold,
          individualModel: event.model,
        ));
      },
      editIndividual: (value) {
        emit(value.copyWith(
          individualModel: event.model,
        ));
      },
    );
  }

  FutureOr<void> _handleSummary(
    BeneficiaryRegistrationSummaryEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    await state.maybeMap(
      orElse: () {
        throw const InvalidRegistrationStateException();
      },
      create: (value) async {
        final individual = value.individualModel;
        final household = value.householdModel;
        final address = value.addressModel;
        final code = event.boundary.code;
        final name = event.boundary.name;
        final locality = code == null || name == null
            ? null
            : LocalityModel(code: code, name: name);

        emit(BeneficiaryRegistrationSummaryState(
            navigateToRoot: false,
            householdModel: household?.copyWith(
                address: address?.copyWith(
              relatedClientReferenceId: household.clientReferenceId,
              auditDetails: individual?.auditDetails,
              clientAuditDetails: individual?.clientAuditDetails,
              locality: locality,
            )),
            individualModel: individual,
            projectBeneficiaryModel: ProjectBeneficiaryModel(
              tag: event.tag,
              rowVersion: 1,
              tenantId: RegistrationDeliverySingleton().tenantId,
              clientReferenceId: IdGen.i.identifier,
              dateOfRegistration: DateTime.now().millisecondsSinceEpoch,
              projectId: event.projectId,
              beneficiaryClientReferenceId:
                  beneficiaryType == BeneficiaryType.individual
                      ? individual?.clientReferenceId
                      : household?.clientReferenceId,
              clientAuditDetails: ClientAuditDetails(
                createdTime: DateTime.now().millisecondsSinceEpoch,
                lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                lastModifiedBy: event.userUuid,
                createdBy: event.userUuid,
              ),
              auditDetails: AuditDetails(
                createdBy: event.userUuid,
                createdTime: DateTime.now().millisecondsSinceEpoch,
              ),
            ),
            isHeadOfHousehold: value.isHeadOfHousehold,
            parentClientReferenceId: event.parentClientReferenceId,
            relationshipType: event.relationshipType,
        ));
      },
    );
  }

  FutureOr<void> _handleCreate(
    BeneficiaryRegistrationCreateEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    await state.maybeMap(
      orElse: () {
        throw const InvalidRegistrationStateException();
      },
      persisted: (value) {},
      summary: (value) async {
        if (event.navigateToSummary) {
          emit(BeneficiaryRegistrationState.create(
              addressModel: value.householdModel?.address,
              householdModel: value.householdModel,
              individualModel: value.individualModel,
              projectBeneficiaryModel: value.projectBeneficiaryModel,
              parentClientReferenceId: event.parentClientReferenceId,
              relationshipType: event.relationshipType,
          ));
        } else {
          final individual = value.individualModel;
          final household = value.householdModel;
          final address = value.householdModel?.address;

          if (individual == null) {
            throw const InvalidRegistrationStateException(
              'Individual cannot be null',
            );
          } else if (household == null) {
            throw const InvalidRegistrationStateException(
              'Household cannot be null',
            );
          }

          try {
            final createdAt = DateTime.now().millisecondsSinceEpoch;

            emit(value.copyWith(loading: true));

            final code = event.boundary.code;
            final name = event.boundary.name;

            final locality = code == null || name == null
                ? null
                : LocalityModel(code: code, name: name);
            await householdRepository.create(
              household.copyWith(
                address: address?.copyWith(
                  relatedClientReferenceId: household.clientReferenceId,
                  auditDetails: individual.auditDetails,
                  clientAuditDetails: individual.clientAuditDetails,
                  locality: locality,
                ),
              ),
            );
            final initialModifiedAt = DateTime.now().millisecondsSinceEpoch;
            await individualRepository.create(
              individual.copyWith(
                address: [
                  address!.copyWith(
                    relatedClientReferenceId: individual.clientReferenceId,
                    auditDetails: individual.auditDetails,
                    clientAuditDetails: individual.clientAuditDetails,
                    locality: locality,
                  ),
                ],
              ),
            );

            final uniqueId = individual.identifiers!.firstWhereOrNull((id) =>
                id.identifierType ==
                IdentifierTypes.uniqueBeneficiaryID.toValue());

            if (uniqueId != null) {
              var id = await uniqueIdPoolLocalRepository
                  .search(UniqueIdPoolSearchModel(id: uniqueId.identifierId!));

              uniqueIdPoolLocalRepository.update(id.firstOrNull!.copyWith(
                status: IdStatus.assigned.toValue(),
              ));
            }

            await projectBeneficiaryRepository.create(
              value.projectBeneficiaryModel!,
            );

            HouseholdMemberRelationShipModel? relationship;
            if (event.parentClientReferenceId != null) {
              relationship = HouseholdMemberRelationShipModel(
                relationshipType: event.relationshipType,
                clientReferenceId: IdGen.i.identifier,
                relativeClientReferenceId: event.parentClientReferenceId,
                selfClientReferenceId: individual.clientReferenceId,
                tenantId: RegistrationDeliverySingleton().tenantId,
                clientAuditDetails: ClientAuditDetails(
                  createdTime: createdAt,
                  lastModifiedTime: initialModifiedAt,
                  lastModifiedBy: event.userUuid,
                  createdBy: event.userUuid,
                ),
              );
            }

            await householdMemberRepository.create(
              HouseholdMemberModel(
                  householdClientReferenceId: household.clientReferenceId,
                  individualClientReferenceId: individual.clientReferenceId,
                  isHeadOfHousehold: value.isHeadOfHousehold,
                  tenantId: RegistrationDeliverySingleton().tenantId,
                  rowVersion: 1,
                  clientReferenceId: IdGen.i.identifier,
                  clientAuditDetails: ClientAuditDetails(
                    createdTime: createdAt,
                    lastModifiedTime: initialModifiedAt,
                    lastModifiedBy: event.userUuid,
                    createdBy: event.userUuid,
                  ),
                  auditDetails: AuditDetails(
                    createdBy: event.userUuid,
                    createdTime: createdAt,
                  ),
                  memberRelationships:
                      relationship != null ? [relationship] : null),
            );
          } catch (error) {
            rethrow;
          } finally {
            emit(
              BeneficiaryRegistrationPersistedState(
                navigateToRoot: false,
                householdModel: household,
                addressModel: address,
                individualModel: individual,
                parentClientReferenceId: event.parentClientReferenceId,
                relationshipType: event.relationshipType,
              ),
            );
          }
        }
      },
      create: (value) async {
        final individual = value.individualModel;
        final household = value.householdModel;
        final address = value.addressModel;
        final dateOfRegistration = value.registrationDate;

        if (individual == null) {
          throw const InvalidRegistrationStateException(
            'Individual cannot be null',
          );
        } else if (household == null) {
          throw const InvalidRegistrationStateException(
            'Household cannot be null',
          );
        } else if (address == null) {
          throw const InvalidRegistrationStateException(
            'Address cannot be null',
          );
        } else if (dateOfRegistration == null) {
          throw const InvalidRegistrationStateException(
            'Registration date cannot be null',
          );
        }

        try {
          final createdAt = DateTime.now().millisecondsSinceEpoch;
          final initialModifiedAt = DateTime.now().millisecondsSinceEpoch;

          emit(value.copyWith(loading: true));

          final code = event.boundary.code;
          final name = event.boundary.name;

          final memberClientReferenceId = IdGen.i.identifier;
          HouseholdMemberRelationShipModel? relationship;
          if (event.parentClientReferenceId != null) {
            relationship = HouseholdMemberRelationShipModel(
              relationshipType: event.relationshipType,
              clientReferenceId: IdGen.i.identifier,
              relativeClientReferenceId: event.parentClientReferenceId,
              selfClientReferenceId: memberClientReferenceId,
              tenantId: RegistrationDeliverySingleton().tenantId,
              clientAuditDetails: ClientAuditDetails(
                createdTime: createdAt,
                lastModifiedTime: initialModifiedAt,
                lastModifiedBy: event.userUuid,
                createdBy: event.userUuid,
              ),
            );
          }

          final locality = code == null || name == null
              ? null
              : LocalityModel(code: code, name: name);
          await householdRepository.create(
            household.copyWith(
              address: address.copyWith(
                relatedClientReferenceId: household.clientReferenceId,
                auditDetails: individual.auditDetails,
                clientAuditDetails: individual.clientAuditDetails,
                locality: locality,
              ),
            ),
          );
          await individualRepository.create(
            individual.copyWith(
              address: [
                address.copyWith(
                  relatedClientReferenceId: individual.clientReferenceId,
                  auditDetails: individual.auditDetails,
                  clientAuditDetails: individual.clientAuditDetails,
                  locality: locality,
                ),
              ],
            ),
          );

          await projectBeneficiaryRepository.create(
            value.projectBeneficiaryModel!,
          );

          await householdMemberRepository.create(
            HouseholdMemberModel(
                householdClientReferenceId: household.clientReferenceId,
                individualClientReferenceId: individual.clientReferenceId,
                isHeadOfHousehold: value.isHeadOfHousehold,
                tenantId: RegistrationDeliverySingleton().tenantId,
                rowVersion: 1,
                clientReferenceId: memberClientReferenceId,
                clientAuditDetails: ClientAuditDetails(
                  createdTime: createdAt,
                  lastModifiedTime: initialModifiedAt,
                  lastModifiedBy: event.userUuid,
                  createdBy: event.userUuid,
                ),
                auditDetails: AuditDetails(
                  createdBy: event.userUuid,
                  createdTime: createdAt,
                ),
                memberRelationships:
                    relationship != null ? [relationship] : null),
          );
        } catch (error) {
          rethrow;
        } finally {
          emit(value.copyWith(loading: false));
          emit(
            BeneficiaryRegistrationPersistedState(
                navigateToRoot: false,
                householdModel: household,
                addressModel: address,
                individualModel: individual,
                parentClientReferenceId: event.parentClientReferenceId,
                relationshipType: event.relationshipType
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _handleUpdateHousehold(
    BeneficiaryRegistrationUpdateHouseholdDetailsEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    await state.maybeMap(
      orElse: () {
        throw const InvalidRegistrationStateException();
      },
      editHousehold: (value) async {
        emit(value.copyWith(loading: true));
        try {
          final HouseholdModel? existingHousehold =
              (await householdRepository.search(HouseholdSearchModel(
            clientReferenceId: [value.householdModel.clientReferenceId],
          )))
                  .firstOrNull;
          await householdRepository.update(
            event.household.copyWith(
              clientAuditDetails: ClientAuditDetails(
                createdBy: value.householdModel.clientAuditDetails?.createdBy ??
                    value.householdModel.auditDetails!.createdBy.toString(),
                createdTime:
                    value.householdModel.clientAuditDetails?.createdTime ??
                        value.householdModel.auditDetails!.createdTime,
                lastModifiedBy:
                    RegistrationDeliverySingleton().loggedInUserUuid,
                lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
              ),
              memberCount: event.household.memberCount,
              address: value.addressModel.copyWith(
                relatedClientReferenceId:
                    value.householdModel.clientReferenceId,
              ),
              id: existingHousehold?.id,
              rowVersion: existingHousehold?.rowVersion ?? 1,
              nonRecoverableError:
                  existingHousehold?.nonRecoverableError ?? false,
            ),
          );
          final projectBeneficiary = await projectBeneficiaryRepository.search(
            ProjectBeneficiarySearchModel(
              projectId: [RegistrationDeliverySingleton().projectId.toString()],
              beneficiaryClientReferenceId:
                  beneficiaryType == BeneficiaryType.individual
                      ? getIndividualBeneficiaryClientReferenceId(
                          value.individualModel)
                      : [event.household.clientReferenceId],
            ),
          );

          if (projectBeneficiary.isNotEmpty) {
            if (projectBeneficiary.first.tag != event.tag) {
              await projectBeneficiaryRepository
                  .update(projectBeneficiary.first.copyWith(tag: event.tag));
            }

            var task = await taskDataRepository.search(TaskSearchModel(
              projectBeneficiaryClientReferenceId:
                  projectBeneficiary.map((e) => e.clientReferenceId).toList(),
            ));

            if (task.isNotEmpty) {
              if (task.last.status == Status.closeHousehold.toValue()) {
                await taskDataRepository.update(task.last
                    .copyWith(status: Status.notAdministered.toValue()));
              }
            }
          } else {
            for (var element in value.individualModel) {
              await projectBeneficiaryRepository.create(ProjectBeneficiaryModel(
                  rowVersion: 1,
                  clientReferenceId: IdGen.i.identifier,
                  dateOfRegistration: DateTime.now().millisecondsSinceEpoch,
                  projectId: RegistrationDeliverySingleton().projectId,
                  tenantId: RegistrationDeliverySingleton().tenantId,
                  beneficiaryClientReferenceId:
                      beneficiaryType == BeneficiaryType.individual
                          ? element.clientReferenceId
                          : value.householdModel.clientReferenceId,
                  clientAuditDetails: ClientAuditDetails(
                    createdBy: RegistrationDeliverySingleton()
                        .loggedInUserUuid
                        .toString(),
                    createdTime: DateTime.now().millisecondsSinceEpoch,
                    lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                    lastModifiedBy: RegistrationDeliverySingleton()
                        .loggedInUserUuid
                        .toString(),
                  ),
                  auditDetails: AuditDetails(
                    createdBy: RegistrationDeliverySingleton()
                        .loggedInUserUuid
                        .toString(),
                    createdTime: DateTime.now().millisecondsSinceEpoch,
                    lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
                    lastModifiedBy: RegistrationDeliverySingleton()
                        .loggedInUserUuid
                        .toString(),
                  )));
            }
          }

          for (var element in value.individualModel) {
            final IndividualModel? existingIndividual =
                (await individualRepository.search(IndividualSearchModel(
              clientReferenceId: [element.clientReferenceId],
            )))
                    .firstOrNull;
            await individualRepository.update(
              element.copyWith(
                address: [
                  if (element.address != null)
                    ...element.address!.map((e) {
                      return value.addressModel.copyWith(
                        id: e.id,
                        relatedClientReferenceId: e.relatedClientReferenceId,
                      );
                    }),
                ],
                id: existingIndividual?.id,
                rowVersion: existingIndividual?.rowVersion ?? 1,
                nonRecoverableError:
                    existingIndividual?.nonRecoverableError ?? false,
              ),
            );
          }
          emit(value.copyWith(loading: false));
          emit(
            BeneficiaryRegistrationPersistedState(
              householdModel: value.householdModel,
              isEdit: true,
            ),
          );
        } catch (error) {
          rethrow;
        } finally {}
      },
    );
  }

  FutureOr<void> _handleUpdateIndividual(
    BeneficiaryRegistrationUpdateIndividualDetailsEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    await state.maybeMap(
      orElse: () {
        throw const InvalidRegistrationStateException();
      },
      editIndividual: (value) async {
        emit(value.copyWith(loading: true));
        try {
          final individual = event.model.copyWith(
            address: [
              event.addressModel.copyWith(
                relatedClientReferenceId: event.model.clientReferenceId,
              ),
            ],
          );

          final projectBeneficiary = await projectBeneficiaryRepository.search(
            ProjectBeneficiarySearchModel(
              beneficiaryClientReferenceId: [
                beneficiaryType == BeneficiaryType.individual
                    ? event.model.clientReferenceId
                    : event.householdModel.clientReferenceId,
              ],
            ),
          );
          final IndividualModel? existingIndividual =
              (await individualRepository.search(IndividualSearchModel(
            clientReferenceId: [individual.clientReferenceId],
          )))
                  .firstOrNull;
          await individualRepository.update(individual.copyWith(
            id: existingIndividual?.id,
            rowVersion: existingIndividual?.rowVersion ?? 1,
            nonRecoverableError:
                existingIndividual?.nonRecoverableError ?? false,
          ));

          final uniqueId = event.model.identifiers!.firstWhereOrNull((id) =>
              id.identifierType ==
              IdentifierTypes.uniqueBeneficiaryID.toValue());

          if (uniqueId != null) {
            var id = await uniqueIdPoolLocalRepository
                .search(UniqueIdPoolSearchModel(id: uniqueId.identifierId!));

            uniqueIdPoolLocalRepository.update(id.firstOrNull!.copyWith(
              status: IdStatus.assigned.toValue(),
            ));
          }

          if (projectBeneficiary.isNotEmpty) {
            if (projectBeneficiary.first.tag != event.tag) {
              await projectBeneficiaryRepository
                  .update(projectBeneficiary.first.copyWith(tag: event.tag));
            }
            var task = await taskDataRepository.search(TaskSearchModel(
              projectBeneficiaryClientReferenceId:
                  projectBeneficiary.map((e) => e.clientReferenceId).toList(),
            ));

            if (task.isNotEmpty) {
              if (task.last.status == Status.closeHousehold.toValue()) {
                await taskDataRepository.update(task.last
                    .copyWith(status: Status.notAdministered.toValue()));
              }
            }
          }
        } catch (error) {
          rethrow;
        } finally {
          emit(value.copyWith(loading: false));
          emit(BeneficiaryRegistrationPersistedState(
            householdModel: value.householdModel,
            projectBeneficiaryModel: value.projectBeneficiaryModel,
          ));
        }
      },
    );
  }

  FutureOr<void> _handleAddMember(
    BeneficiaryRegistrationAddMemberEvent event,
    BeneficiaryRegistrationEmitter emit,
  ) async {
    await state.maybeMap(
      orElse: () {
        throw const InvalidRegistrationStateException();
      },
      addMember: (value) async {
        emit(value.copyWith(loading: true));
        try {
          final createdAt = DateTime.now().millisecondsSinceEpoch;
          final initialModifiedAt = DateTime.now().millisecondsSinceEpoch;

          await individualRepository.create(
            event.individualModel.copyWith(
              address: [
                value.addressModel.copyWith(
                  relatedClientReferenceId:
                      event.individualModel.clientReferenceId,
                  auditDetails: AuditDetails(
                    createdBy: event.userUuid,
                    createdTime: createdAt,
                    lastModifiedTime: createdAt,
                    lastModifiedBy: event.userUuid,
                  ),
                  clientAuditDetails: ClientAuditDetails(
                    createdTime: createdAt,
                    lastModifiedTime: initialModifiedAt,
                    lastModifiedBy: event.userUuid,
                    createdBy: event.userUuid,
                  ),
                ),
              ],
            ),
          );

          final uniqueId = event.individualModel.identifiers!.firstWhereOrNull(
              (id) =>
                  id.identifierType ==
                  IdentifierTypes.uniqueBeneficiaryID.toValue());

          if (uniqueId != null) {
            var id = await uniqueIdPoolLocalRepository
                .search(UniqueIdPoolSearchModel(id: uniqueId.identifierId!));

            uniqueIdPoolLocalRepository.update(id.firstOrNull!.copyWith(
              status: IdStatus.assigned.toValue(),
            ));
          }

          if (event.beneficiaryType == BeneficiaryType.individual) {
            await projectBeneficiaryRepository.create(
              ProjectBeneficiaryModel(
                tag: event.tag,
                rowVersion: 1,
                tenantId: RegistrationDeliverySingleton().tenantId,
                clientReferenceId: IdGen.i.identifier,
                dateOfRegistration: DateTime.now().millisecondsSinceEpoch,
                projectId: event.projectId,
                beneficiaryClientReferenceId:
                    event.individualModel.clientReferenceId,
                auditDetails: AuditDetails(
                  createdBy: event.userUuid,
                  createdTime: createdAt,
                ),
                clientAuditDetails: ClientAuditDetails(
                  createdTime: createdAt,
                  lastModifiedTime: initialModifiedAt,
                  lastModifiedBy: event.userUuid,
                  createdBy: event.userUuid,
                ),
              ),
            );
          }

          final memberClientReferenceId = IdGen.i.identifier;

          HouseholdMemberRelationShipModel? relationship;
          if (event.parentClientReferenceId != null) {
            relationship = HouseholdMemberRelationShipModel(
              relationshipType: event.relationshipType,
              clientReferenceId: IdGen.i.identifier,
              relativeClientReferenceId: event.parentClientReferenceId,
              selfClientReferenceId: memberClientReferenceId,
              tenantId: RegistrationDeliverySingleton().tenantId,
              clientAuditDetails: ClientAuditDetails(
                createdTime: createdAt,
                lastModifiedTime: initialModifiedAt,
                lastModifiedBy: event.userUuid,
                createdBy: event.userUuid,
              ),
            );
          }

          await householdMemberRepository.create(
            HouseholdMemberModel(
                householdClientReferenceId:
                    value.householdModel.clientReferenceId,
                individualClientReferenceId:
                    event.individualModel.clientReferenceId,
                isHeadOfHousehold: false,
                tenantId: RegistrationDeliverySingleton().tenantId,
                rowVersion: 1,
                clientReferenceId: memberClientReferenceId,
                auditDetails: AuditDetails(
                  createdBy: event.userUuid,
                  createdTime: createdAt,
                ),
                clientAuditDetails: ClientAuditDetails(
                  createdTime: createdAt,
                  lastModifiedTime: initialModifiedAt,
                  lastModifiedBy: event.userUuid,
                  createdBy: event.userUuid,
                ),
                memberRelationships:
                    relationship != null ? [relationship] : null),
          );
        } catch (error) {
          rethrow;
        } finally {
          emit(value.copyWith(loading: false));
          emit(BeneficiaryRegistrationPersistedState(
            householdModel: value.householdModel,
            parentClientReferenceId: event.parentClientReferenceId,
            relationshipType: event.relationshipType,
          ));
        }
      },
    );
  }

  getIndividualBeneficiaryClientReferenceId(
      List<IndividualModel> individualModel) {
    return individualModel.map((e) => e.clientReferenceId).toList();
  }
}

@freezed
class BeneficiaryRegistrationEvent with _$BeneficiaryRegistrationEvent {
  const factory BeneficiaryRegistrationEvent.saveAddress(
    AddressModel model,
  ) = BeneficiaryRegistrationSaveAddressEvent;

  const factory BeneficiaryRegistrationEvent.saveHouseDetails({
    required HouseholdModel model,
  }) = BeneficiaryRegistrationSaveHouseDetailsEvent;

  const factory BeneficiaryRegistrationEvent.saveHouseholdDetails({
    required HouseholdModel household,
    required DateTime registrationDate,
  }) = BeneficiaryRegistrationSaveHouseholdDetailsEvent;

  const factory BeneficiaryRegistrationEvent.saveIndividualDetails({
    required IndividualModel model,
    final String? parentClientReferenceId,
    final String? relationshipType,
    @Default(false) bool isHeadOfHousehold,
  }) = BeneficiaryRegistrationSaveIndividualDetailsEvent;

  const factory BeneficiaryRegistrationEvent.addMember({
    required HouseholdModel householdModel,
    required IndividualModel individualModel,
    required AddressModel addressModel,
    final String? parentClientReferenceId,
    final String? relationshipType,
    required String userUuid,
    required String projectId,
    String? tag,
    required BeneficiaryType beneficiaryType,
  }) = BeneficiaryRegistrationAddMemberEvent;

  const factory BeneficiaryRegistrationEvent.updateHouseholdDetails({
    required HouseholdModel household,
    AddressModel? addressModel,
    String? tag,
  }) = BeneficiaryRegistrationUpdateHouseholdDetailsEvent;

  const factory BeneficiaryRegistrationEvent.updateIndividualDetails({
    required IndividualModel model,
    String? tag,
    required HouseholdModel householdModel,
    required AddressModel addressModel,
    final String? parentClientReferenceId,
    final String? relationshipType,
  }) = BeneficiaryRegistrationUpdateIndividualDetailsEvent;

  const factory BeneficiaryRegistrationEvent.create(
          {required String userUuid,
          required String projectId,
          required BoundaryModel boundary,
          final String? parentClientReferenceId,
            final String? relationshipType,
          String? tag,
          @Default(true) bool navigateToSummary}) =
      BeneficiaryRegistrationCreateEvent;

  const factory BeneficiaryRegistrationEvent.summary(
          {required String userUuid,
          required String projectId,
          required BoundaryModel boundary,
          final String? parentClientReferenceId,
            final String? relationshipType,
          String? tag,
          @Default(true) bool navigateToSummary}) =
      BeneficiaryRegistrationSummaryEvent;

  const factory BeneficiaryRegistrationEvent.validate({
    required String tag,
  }) = BeneficiaryRegistrationTagEvent;
}

@freezed
class BeneficiaryRegistrationState with _$BeneficiaryRegistrationState {
  const factory BeneficiaryRegistrationState.create({
    AddressModel? addressModel,
    HouseholdModel? householdModel,
    IndividualModel? individualModel,
    ProjectBeneficiaryModel? projectBeneficiaryModel,
    final String? parentClientReferenceId,
    final String? relationshipType,
    DateTime? registrationDate,
    String? searchQuery,
    @Default(false) bool loading,
    @Default(false) bool isHeadOfHousehold,
    List<ServiceModel>? householdChecklists,
    List<ServiceModel>? individualChecklists,
  }) = BeneficiaryRegistrationCreateState;

  const factory BeneficiaryRegistrationState.editHousehold({
    required AddressModel addressModel,
    required HouseholdModel householdModel,
    required List<IndividualModel> individualModel,
    final String? parentClientReferenceId,
    final String? relationshipType,
    required DateTime registrationDate,
    ProjectBeneficiaryModel? projectBeneficiaryModel,
    @Default(false) bool loading,
    IndividualModel? headOfHousehold,
    List<ServiceModel>? householdChecklists,
    List<ServiceModel>? individualChecklists,
  }) = BeneficiaryRegistrationEditHouseholdState;

  const factory BeneficiaryRegistrationState.editIndividual({
    required HouseholdModel householdModel,
    required IndividualModel individualModel,
    required AddressModel addressModel,
    final String? parentClientReferenceId,
    final String? relationshipType,
    ProjectBeneficiaryModel? projectBeneficiaryModel,
    @Default(false) bool loading,
    List<ServiceModel>? householdChecklists,
    List<ServiceModel>? individualChecklists,
  }) = BeneficiaryRegistrationEditIndividualState;

  const factory BeneficiaryRegistrationState.addMember({
    required AddressModel addressModel,
    required HouseholdModel householdModel,
    final String? parentClientReferenceId,
    final String? relationshipType,
    @Default(false) bool loading,
    List<ServiceModel>? householdChecklists,
    List<ServiceModel>? individualChecklists,
  }) = BeneficiaryRegistrationAddMemberState;

  const factory BeneficiaryRegistrationState.persisted({
    @Default(true) bool navigateToRoot,
    required HouseholdModel householdModel,
    IndividualModel? individualModel,
    ProjectBeneficiaryModel? projectBeneficiaryModel,
    final String? parentClientReferenceId,
    final String? relationshipType,
    DateTime? registrationDate,
    AddressModel? addressModel,
    @Default(false) bool loading,
    @Default(false) bool isEdit,
    @Default(false) bool isHeadOfHousehold,
    List<ServiceModel>? householdChecklists,
    List<ServiceModel>? individualChecklists,
  }) = BeneficiaryRegistrationPersistedState;

  const factory BeneficiaryRegistrationState.summary({
    @Default(true) bool navigateToRoot,
    HouseholdModel? householdModel,
    IndividualModel? individualModel,
    ProjectBeneficiaryModel? projectBeneficiaryModel,
    final String? parentClientReferenceId,
    final String? relationshipType,
    DateTime? registrationDate,
    AddressModel? addressModel,
    @Default(false) bool loading,
    @Default(false) bool isHeadOfHousehold,
    List<ServiceModel>? householdChecklists,
    List<ServiceModel>? individualChecklists,
  }) = BeneficiaryRegistrationSummaryState;
}

class InvalidRegistrationStateException implements Exception {
  final String? message;

  const InvalidRegistrationStateException([this.message]);
}
