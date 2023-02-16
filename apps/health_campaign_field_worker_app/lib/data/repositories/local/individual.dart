import 'dart:async';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

import '../../../models/data_model.dart';
import '../../../models/entities/individual_address.dart';
import '../../../models/entities/individual_identifier.dart';
import '../../../models/entities/individual_name.dart';
import '../../../utils/environment_config.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';

class IndividualLocalRepository
    extends LocalRepository<IndividualModel, IndividualSearchModel> {
  const IndividualLocalRepository(super.sql, super.opLogManager);

  @override
  DataModelType get type => DataModelType.individual;

  @override
  FutureOr<List<IndividualModel>> search(IndividualSearchModel query) async {
    final selectQuery = sql.select(sql.individual).join(
      [
        leftOuterJoin(
          sql.individualName,
          sql.individualName.individual.equalsExp(
            sql.individual.clientReferenceId,
          ),
        ),
        leftOuterJoin(
          sql.individualAddress,
          sql.individualAddress.individual.equalsExp(
            sql.individual.clientReferenceId,
          ),
        ),
        leftOuterJoin(
          sql.individualIdentifier,
          sql.individualIdentifier.individual.equalsExp(
            sql.individual.clientReferenceId,
          ),
        ),
        leftOuterJoin(
          sql.address,
          sql.address.clientReferenceId.equalsExp(
            sql.individualAddress.address,
          ),
        ),
        leftOuterJoin(
          sql.name,
          sql.name.clientReferenceId.equalsExp(
            sql.individualName.name,
          ),
        ),
        leftOuterJoin(
          sql.identifier,
          sql.identifier.clientReferenceId.equalsExp(
            sql.individualIdentifier.identifier,
          ),
        ),
      ],
    );

    final results = await (selectQuery
          ..where(
            buildAnd([
              if (query.clientReferenceId != null)
                sql.individual.clientReferenceId.isIn(
                  query.clientReferenceId!,
                ),
              if (query.id != null)
                sql.individual.id.equals(
                  query.id,
                ),
              if (query.tenantId != null)
                sql.individual.tenantId.equals(
                  query.tenantId,
                ),
              if (query.dateOfBirth != null)
                sql.individual.dateOfBirth.equals(
                  query.dateOfBirth,
                ),
              if (query.gender != null)
                sql.individual.gender.equals(
                  query.gender?.index,
                ),
              if (query.name?.givenName != null)
                sql.name.givenName.contains(
                  query.name!.givenName!,
                ),
              if (query.name?.familyName != null)
                sql.name.familyName.equals(
                  query.name!.familyName,
                ),
              if (query.name?.otherNames != null)
                sql.name.otherNames.equals(
                  query.name!.otherNames,
                ),
            ]),
          ))
        .get();

    return results.map((e) {
      final individual = e.readTable(sql.individual);
      final name = e.readTableOrNull(sql.name);
      final address = e.readTableOrNull(sql.address);
      final identifier = e.readTableOrNull(sql.identifier);

      return IndividualModel(
        tenantId: individual.tenantId,
        clientReferenceId: individual.clientReferenceId,
        dateOfBirth: individual.dateOfBirth,
        mobileNumber: individual.mobileNumber,
        rowVersion: individual.rowVersion,
        name: name == null
            ? null
            : NameModel(
                clientReferenceId: name.clientReferenceId,
                familyName: name.familyName,
                givenName: name.givenName,
                otherNames: name.otherNames,
                rowVersion: name.rowVersion,
                tenantId: name.tenantId,
              ),
        bloodGroup: individual.bloodGroup,
        address: [
          address == null
              ? null
              : AddressModel(
                  tenantId: address.tenantId,
                  clientReferenceId: address.clientReferenceId,
                  doorNo: address.doorNo,
                  latitude: address.latitude,
                  longitude: address.longitude,
                  locationAccuracy: address.locationAccuracy,
                  addressLine1: address.addressLine1,
                  addressLine2: address.addressLine2,
                  city: address.city,
                  pincode: address.pincode,
                  type: address.type,
                  rowVersion: address.rowVersion,
                ),
        ].whereNotNull().toList(),
        gender: individual.gender,
        identifiers: [
          if (identifier != null)
            IdentifierModel(
              identifierType: identifier.identifierType,
              clientReferenceId: identifier.clientReferenceId,
              identifierId: identifier.identifierId,
              rowVersion: identifier.rowVersion,
              tenantId: identifier.tenantId,
            ),
        ],
      );
    }).toList();
  }

  @override
  FutureOr<void> create(IndividualModel entity) async {
    final addresses = entity.address;
    final identifiers = entity.identifiers;

    final individualCompanion = entity.companion;
    final nameCompanion = entity.name?.companion;

    await sql.batch((batch) async {
      batch.insert(sql.individual, individualCompanion);
      if (nameCompanion != null) {
        batch.insert(sql.name, nameCompanion);
        batch.insert(
          sql.individualName,
          IndividualNameModel(
            clientReferenceId: IdGen.i.identifier,
            tenantId: envConfig.variables.tenantId,
            rowVersion: 1,
            name: entity.name,
            individual: entity,
          ).companion,
        );
      }

      if (addresses != null) {
        final addressCompanions = addresses.map((e) {
          return e.companion;
        }).toList();

        batch.insertAll(
          sql.address,
          addressCompanions,
          mode: InsertMode.insertOrReplace,
        );

        batch.insertAll(
          sql.individualAddress,
          addresses.map(
            (e) {
              return IndividualAddressModel(
                clientReferenceId: IdGen.i.identifier,
                tenantId: envConfig.variables.tenantId,
                rowVersion: 1,
                individual: entity,
                address: e,
              ).companion;
            },
          ),
        );
      }

      if (identifiers != null) {
        final identifierCompanions = identifiers.map((e) {
          return e.companion;
        }).toList();

        batch.insertAll(sql.identifier, identifierCompanions);

        batch.insertAll(
          sql.individualIdentifier,
          identifiers.map(
            (e) => IndividualIdentifierModel(
              clientReferenceId: IdGen.i.identifier,
              tenantId: envConfig.variables.tenantId,
              rowVersion: 1,
              individual: entity,
              identifier: e,
            ).companion,
          ),
        );
      }
    });

    await super.create(entity);
  }

  @override
  FutureOr<void> update(IndividualModel entity) async {
    final individualCompanion = entity.companion;

    final nameCompanion = entity.name?.companion;
    final addressCompanions = entity.address?.map((e) {
          return e.companion;
        }).toList() ??
        [];

    final identifierCompanions = entity.identifiers?.map((e) {
          return e.companion;
        }).toList() ??
        [];

    await sql.batch((batch) async {
      if (nameCompanion != null) {
        batch.update(
          sql.name,
          nameCompanion,
          where: (table) => table.clientReferenceId.equals(
            nameCompanion.clientReferenceId.value,
          ),
        );
      }

      batch.update(
        sql.individual,
        individualCompanion,
        where: (table) => table.clientReferenceId.equals(
          entity.clientReferenceId,
        ),
      );

      batch.insertAllOnConflictUpdate(sql.address, addressCompanions);
      batch.insertAllOnConflictUpdate(sql.identifier, identifierCompanions);
    });

    await super.update(entity);
  }
}
