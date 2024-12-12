import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../localized.dart';

// Extension on List to add a mapIndexed method
extension ListExtensions<E> on List<E> {
  // This method takes a function as an argument, which itself takes two arguments:
  // the index of the current item and the item itself.
  Iterable<T> mapIndexed<T>(T Function(int index, E item) function) sync* {
    for (var index = 0; index < length; index++) {
      yield function(index, this[index]);
    }
  }
}

/// ReadonlyDigitGrid widget class
class ReadonlyDigitGrid extends LocalizedStatefulWidget {
  /// Data for the grid
  final DigitGridData data;

  /// Constructor for ReadonlyDigitGrid
  const ReadonlyDigitGrid({
    super.key,
    required this.data,
  });

  /// Creating the state for ReadonlyDigitGrid
  @override
  State<StatefulWidget> createState() => ReadonlyDigitGridState();
}

/// State class for ReadonlyDigitGrid
class ReadonlyDigitGridState extends LocalizedState<ReadonlyDigitGrid> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Returns a PlutoGrid with the given configuration and data
    return PlutoGrid(
      mode: PlutoGridMode.readOnly,
      noRowsWidget: Center(
          child: Text(localizations.translate(
        i18.common.noResultsFound,
      ))),
      configuration: PlutoGridConfiguration(
        scrollbar: const PlutoGridScrollbarConfig(
          isAlwaysShown: true,
        ),
        columnSize: const PlutoGridColumnSizeConfig(
          resizeMode: PlutoResizeMode.none,
          restoreAutoSizeAfterFrozenColumn: true,
        ),
        style: PlutoGridStyleConfig(
          gridBorderColor: theme.colorTheme.generic.background,
          oddRowColor: theme.colorTheme.generic.background,
          borderColor: theme.colorTheme.generic.background,
          iconColor: Colors.transparent,
          evenRowColor: Colors.transparent,
          activatedColor: theme.colorTheme.primary.primary1.withOpacity(
                0.2,
              ),
          activatedBorderColor: theme.colorTheme.primary.primary1.withOpacity(
                0.8,
              ),
          enableRowColorAnimation: true,
        ),
      ),
      columns: [
        // Mapping the columns data to PlutoColumn
        ...widget.data.columns.mapIndexed(
          (index, element) {
            final first = index == 0;

            return PlutoColumn(
              title: element.label,
              field: element.key,
              type: PlutoColumnType.text(),
              enableContextMenu: false,
              enableColumnDrag: false,
              width: element.width,
              cellPadding: first ? EdgeInsets.zero : null,
              frozen: first ? PlutoColumnFrozen.start : PlutoColumnFrozen.none,
              renderer: first
                  ? (rendererContext) => Container(
                        color: Colors.white,
                        child: Center(
                          child: Text(rendererContext.cell.value.toString()),
                        ),
                      )
                  : null,
            );
          },
        ),
      ],
      rows: [
        // Mapping the rows data to PlutoRow
        ...widget.data.rows.map(
          (e) => PlutoRow(
            cells: Map.fromEntries(
              e.cells.map(
                (e) => MapEntry(
                  e.key,
                  PlutoCell(value: e.value),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Class for the grid data
class DigitGridData {
  /// Columns and rows for the grid
  final List<DigitGridColumn> columns;
  final List<DigitGridRow> rows;

  /// Constructor for DigitGridData
  DigitGridData({
    required this.columns,
    this.rows = const [],
  }) : assert(rows.every((e) => e.cells.length == columns.length));
}

/// Class for the grid column
class DigitGridColumn {
  /// Label, key and width for the column
  final String label;
  final String key;
  final double width;

  /// Constructor for DigitGridColumn
  const DigitGridColumn({
    required this.label,
    required this.key,
    this.width = 100,
  });
}

/// Class for the grid row
class DigitGridRow {
  /// Cells for the row
  final List<DigitGridCell> cells;

  /// Constructor for DigitGridRow
  DigitGridRow(this.cells);
}

/// Class for the grid cell
class DigitGridCell {
  /// Key and value for the cell
  final String key;
  final String value;

  /// Constructor for DigitGridCell
  const DigitGridCell({
    required this.key,
    required this.value,
  });
}
