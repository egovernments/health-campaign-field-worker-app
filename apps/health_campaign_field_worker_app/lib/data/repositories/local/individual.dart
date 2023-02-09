import 'dart:async';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../models/data_model.dart';
import '../../../utils/utils.dart';
import '../../data_repository.dart';
import '../../local_store/sql_store/sql_store.dart';

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
                sql.individual.clientReferenceId.equals(
                  query.clientReferenceId,
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
                sql.name.givenName.equals(
                  query.name!.givenName,
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
      final name = e.readTable(sql.name);
      final address = e.readTable(sql.address);
      final identifier = e.readTableOrNull(sql.identifier);

      return IndividualModel(
        tenantId: individual.tenantId,
        clientReferenceId: individual.clientReferenceId,
        dateOfBirth: individual.dateOfBirth,
        mobileNumber: individual.mobileNumber,
        rowVersion: individual.rowVersion,
        name: NameModel(
          clientReferenceId: name.clientReferenceId,
          familyName: name.familyName,
          givenName: name.givenName,
          otherNames: name.otherNames,
        ),
        bloodGroup: individual.bloodGroup,
        address: [
          AddressModel(
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
            locality: BoundaryModel(
              clientReferenceId: '',
              code: '',
              name: '',
            ),
            type: address.type,
          ),
        ],
        gender: individual.gender,
        identifiers: [
          if (identifier != null)
            IdentifierModel(
              type: identifier.type,
              clientReferenceId: identifier.clientReferenceId,
              id: identifier.id,
            ),
        ],
      );
    }).toList();
  }

  @override
  FutureOr<void> create(IndividualModel entity) async {
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
      batch.insert(sql.individual, individualCompanion);
      if (nameCompanion != null) batch.insert(sql.name, nameCompanion);
      batch.insertAll(sql.address, addressCompanions);
      batch.insertAll(sql.identifier, identifierCompanions);

      batch.insert(
        sql.individualName,
        IndividualNameCompanion.insert(
          clientReferenceId: const Uuid().v1(),
          individual: Value(individualCompanion.clientReferenceId.value),
          name: Value(nameCompanion?.clientReferenceId.value),
        ),
      );

      batch.insertAll(
        sql.individualAddress,
        addressCompanions.map(
          (e) => IndividualAddressCompanion.insert(
            clientReferenceId: const Uuid().v1(),
            individual: Value(individualCompanion.clientReferenceId.value),
            address: Value(e.clientReferenceId.value),
          ),
        ),
      );

      batch.insertAll(
        sql.individualIdentifier,
        identifierCompanions.map(
          (e) => IndividualIdentifierCompanion.insert(
            clientReferenceId: const Uuid().v1(),
            individual: Value(individualCompanion.clientReferenceId.value),
            identifier: Value(e.clientReferenceId.value),
          ),
        ),
      );
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
