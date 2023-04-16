import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/boundary/boundary.dart';
import '../models/data_model.dart';

class BoundarySelectionPage extends StatelessWidget {
  const BoundarySelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<BoundaryBloc, BoundaryState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final labelList = state.selectedBoundaryMap.keys.toList();

            return ScrollableContent(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, labelIndex) {
                      final label = labelList.elementAt(labelIndex);

                      final filteredItems = state.boundaryList.where((element) {
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

                      print('$label ${filteredItems.length}');

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kPadding * 2,
                        ),
                        child: DigitDropdown<BoundaryModel>(
                          value: state.selectedBoundaryMap.entries
                              .firstWhereOrNull(
                                (element) => element.key == label,
                              )
                              ?.value,
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
                          },
                          valueMapper: (value) {
                            return value.name ?? value.code ?? 'No Value';
                          },
                        ),
                      );
                    },
                    childCount: labelList.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
