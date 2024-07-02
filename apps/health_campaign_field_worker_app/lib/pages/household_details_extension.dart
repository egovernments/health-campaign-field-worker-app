import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_delivery/blocs/beneficiary_registration/beneficiary_registration.dart';
import 'package:registration_delivery/models/entities/household.dart';
import 'package:registration_delivery/pages/beneficiary_registration/household_details.dart';

import '../blocs/custom_bloc.dart';

@RoutePage()
class CustomHouseHoldDetailsPage extends HouseHoldDetailsPage {
  const CustomHouseHoldDetailsPage({super.key, super.appLocalizations});

  @override
  State<HouseHoldDetailsPage> createState() =>
      CustomHouseHoldDetailsPageState();
}

class CustomHouseHoldDetailsPageState extends HouseHoldDetailsPageState {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: BlocBuilder<BeneficiaryRegistrationBloc,
          BeneficiaryRegistrationState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(child: super.build(context)),
              ElevatedButton(
                onPressed: () {
                  state.maybeWhen(
                      orElse: () {},
                      create: (
                        address,
                        householdModel,
                        individualModel,
                        registrationDate,
                        searchQuery,
                        loading,
                        isHeadOfHousehold,
                      ) {
                        HouseholdModel householdModel = HouseholdModel(
                          address: address,
                          clientReferenceId: IdGen.i.identifier,
                        );
                        context.read<CustomBeneficiaryRegistrationBloc>().add(
                              CustomEvent.newEvent(
                                houseHoldModel: householdModel,
                              ),
                            );
                      });
                },
                child: const Text('Custom Event'),
              ),
            ],
          );
        },
      ),
    );
  }
}
