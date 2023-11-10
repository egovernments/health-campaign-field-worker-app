import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/boundary/boundary.dart';
import '../models/data_model.dart';

class BoundarySelectionPage extends StatefulWidget {
  const BoundarySelectionPage({Key? key}) : super(key: key);

  @override
  State<BoundarySelectionPage> createState() => _BoundarySelectionPageState();
}

class _BoundarySelectionPageState extends State<BoundarySelectionPage> {
  bool shouldPop = false;
  Map<String, FormControl<BoundaryModel>> formControls = {};

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => shouldPop,
      child: BlocBuilder<BoundaryBloc, BoundaryState>(
        builder: (context, state) {
          final selectedBoundary = state.selectedBoundaryMap.entries
              .lastWhereOrNull((element) => element.value != null);

          return Scaffold(
            body: Builder(
              builder: (context) {
                if (state.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final labelList = state.selectedBoundaryMap.keys.toList();

                return ReactiveFormBuilder(
                  form: () => buildForm(state),
                  builder: (context, form, child) => Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: labelList.length,
                          itemBuilder: (context, labelIndex) {
                            final label = labelList.elementAt(labelIndex);

                            final filteredItems =
                                state.boundaryList.where((element) {
                              if (element.label != label) return false;

                              if (labelIndex == 0) return true;
                              final parentIndex = labelIndex - 1;

                              final parentBoundaryEntry = state
                                  .selectedBoundaryMap.entries
                                  .elementAtOrNull(parentIndex);
                              final parentBoundary = parentBoundaryEntry?.value;
                              if (parentBoundary == null) return false;

                              if (element.materializedPathList
                                  .contains(parentBoundary.code)) {
                                return true;
                              }

                              return false;
                            }).toList();

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kPadding * 2,
                              ),
                              child: DigitDropdown<BoundaryModel>(
                                initialValue: formControls[label]?.value,
                                label: label,
                                menuItems: filteredItems,
                                onChanged: (value) {
                                  if (value == null) return;

                                  context.read<BoundaryBloc>().add(
                                        BoundarySelectEvent(
                                          label: label,
                                          selectedBoundary: value,
                                        ),
                                      );
                                  formControls[label]?.updateValue(value);
                                  // Call the resetChildDropdowns function when a parent dropdown is selected
                                  resetChildDropdowns(label, state);
                                },
                                valueMapper: (value) {
                                  return value.name ?? value.code ?? 'No Value';
                                },
                                formControlName: label,
                              ),
                            );
                          },
                        ),
                      ),
                      DigitCard(
                        margin:
                            const EdgeInsets.only(left: 0, right: 0, top: 10),
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: kPadding * 2,
                              right: kPadding * 2,
                            ),
                            child: DigitElevatedButton(
                              onPressed: selectedBoundary == null
                                  ? null
                                  : () async {
                                      setState(() {
                                        shouldPop = true;
                                      });

                                      context.read<BoundaryBloc>().add(
                                            const BoundarySubmitEvent(),
                                          );

                                      Future.delayed(
                                        const Duration(milliseconds: 100),
                                        () => context.router.pop(),
                                      );
                                    },
                              child: const Text('Submit'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void resetChildDropdowns(String parentLabel, BoundaryState state) {
    final labelList = state.selectedBoundaryMap.keys.toList();
    final parentIndex = labelList.indexOf(parentLabel);

    for (int i = parentIndex + 1; i < labelList.length; i++) {
      final label = labelList[i];
      formControls[label]?.updateValue(null);
    }
  }

  FormGroup buildForm(BoundaryState state) {
    formControls = {};
    final labelList = state.selectedBoundaryMap.keys.toList();

    for (final label in labelList) {
      formControls[label] = FormControl<BoundaryModel>(
        validators: label == labelList.first ? [Validators.required] : [],
        value: state.selectedBoundaryMap[label],
      );
    }

    return fb.group(formControls);
  }
}
