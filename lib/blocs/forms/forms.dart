import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/models/property_schema/property_schema.dart';
import 'package:forms_engine/models/schema_object/schema_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forms.freezed.dart';

typedef FormsStateEmitter = Emitter<FormsState>;

class FormsBloc extends Bloc<FormsEvent, FormsState> {
  FormsBloc() : super(const FormsState()) {
    on<FormsLoadEvent>(_loadForm);
  }

  // ignore: long-method
  FutureOr<void> _loadForm(FormsLoadEvent event, FormsStateEmitter emit) {
    emit(
      state.copyWith(
        schema: SchemaObject(
          name: event.name,
          version: 1,
          pages: {
            'beneficiaryLocation': const PropertySchema(
              type: PropertySchemaType.object,
              label: 'Beneficiary Location',
              properties: {
                'administrativeArea': PropertySchema(
                  type: PropertySchemaType.string,
                  label: 'Administrative Area *',
                ),
                'houseNumber': PropertySchema(
                  type: PropertySchemaType.string,
                  label: 'House Number',
                ),
                'locality': PropertySchema(
                  type: PropertySchemaType.string,
                  label: 'Locality',
                ),
                'landmark': PropertySchema(
                  type: PropertySchemaType.string,
                  label: 'Landmark',
                ),
                'latlng': PropertySchema(
                  type: PropertySchemaType.string,
                  label: 'Lat/Long *',
                ),
              },
            ),
            'beneficiaryDetails': const PropertySchema(
              type: PropertySchemaType.object,
              label: 'Beneficiary Details',
              properties: {
                'dateOfRegistration': PropertySchema(
                  type: PropertySchemaType.string,
                  label: 'Date of Registration',
                  format: PropertySchemaFormat.date,
                  value: '2022-10-14',
                ),
                'numberOfMembers': PropertySchema(
                  type: PropertySchemaType.integer,
                  label: 'Number of members living in the household',
                  format: PropertySchemaFormat.incrementer,
                ),
                'nameOfIndividual': PropertySchema(
                  type: PropertySchemaType.string,
                  label: 'Name of the individual',
                ),
                'idType': PropertySchema(
                  type: PropertySchemaType.string,
                  label: 'ID Type',
                  enums: ['National ID', 'Tax ID', 'System generated'],
                ),
                'idNumber': PropertySchema(
                  type: PropertySchemaType.string,
                  label: 'ID Number',
                ),
                'dob': PropertySchema(
                  type: PropertySchemaType.string,
                  label: 'Date of Birth',
                  format: PropertySchemaFormat.date,
                ),
                'gender': PropertySchema(
                  type: PropertySchemaType.string,
                  label: 'Gender',
                  enums: ['Male', 'Female', 'Other'],
                ),
                'phone': PropertySchema(
                  type: PropertySchemaType.string,
                  label: 'Phone Number',
                ),
              },
            ),
            'updateDelivery': const PropertySchema(
              label: 'Update Delivery',
              type: PropertySchemaType.object,
              properties: {
                'numberDistributed': PropertySchema(
                  type: PropertySchemaType.integer,
                  label: 'Number of Bednets distributed',
                ),
                'reasonIfNotDelivered': PropertySchema(
                  type: PropertySchemaType.string,
                  label: 'Reason if not delivered',
                ),
              },
            ),
          },
        ),
      ),
    );
  }
}

@freezed
class FormsEvent with _$FormsEvent {
  const factory FormsEvent.load(String name) = FormsLoadEvent;

  // const factory FormsEvent.next() = FormsNextPageEvent;
}

@freezed
class FormsState with _$FormsState {
  const factory FormsState({SchemaObject? schema}) = _FormsState;
}
