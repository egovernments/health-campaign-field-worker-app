import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/boundary/boundary.dart';
import '../models/data_model.dart';

class BoundarySelectionPage extends StatelessWidget {
  const BoundarySelectionPage({Key? key}) : super(key: key);

  FormGroup buildForm(BoundaryState state) {
    final selected = state.selectedBoundary;
    final labelList = state.boundaryMapperList;

    return fb.group(
      Map.fromEntries(
        labelList.mapIndexed(
          (index, label) {
            return MapEntry(
              label,
              FormControl<BoundaryModel>(
                value: selected.elementAtOrNull(index),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('------------------------------------');

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: BlocBuilder<BoundaryBloc, BoundaryState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ReactiveFormBuilder(
              form: () => buildForm(state),
              builder: (context, form, child) {
                final labelList = state.boundaryMapperList;

                return BlocListener<BoundaryBloc, BoundaryState>(
                  listener: (consumerContext, state) {
                    final selected = state.selectedBoundary;
                    form.addAll(
                      Map.fromEntries(
                        state.boundaryMapperList.mapIndexed(
                          (index, label) {
                            return MapEntry(
                              label,
                              FormControl<BoundaryModel>(
                                value: selected.elementAtOrNull(index),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  child: ScrollableContent(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, labelIndex) {
                            final label = labelList.elementAt(labelIndex);

                            return ReactiveFormConsumer(
                              builder: (formContext, form, child) {
                                final filteredItems =
                                    state.boundaryList.where((element) {
                                  if (element.label != label) {
                                    return false;
                                  }

                                  if (labelIndex == 0) return true;

                                  BoundaryModel? selectedParent;
                                  final parentLabel = labelList.elementAtOrNull(
                                    labelIndex - 1,
                                  );

                                  if (parentLabel == null) return false;
                                  selectedParent = form
                                      .control(parentLabel)
                                      .value as BoundaryModel?;

                                  if (selectedParent == null) return false;

                                  final materializedPath =
                                      element.materializedPath?.split('.') ??
                                          [];

                                  final materializedParentId = materializedPath
                                      .elementAtOrNull(labelIndex - 1);

                                  if (materializedParentId == null) {
                                    return false;
                                  }

                                  return materializedParentId ==
                                      selectedParent.code;
                                }).toList();

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: kPadding * 2,
                                  ),
                                  child: DigitDropdown<BoundaryModel>(
                                    label: label,
                                    menuItems: filteredItems,
                                    formControlName: label,
                                    valueMapper: (value) {
                                      return value.name ??
                                          value.code ??
                                          'No Value';
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          childCount: labelList.length,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
