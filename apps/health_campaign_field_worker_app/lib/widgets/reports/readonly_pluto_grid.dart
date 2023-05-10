import 'package:digit_components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class ReadonlyDigitGrid extends StatelessWidget {
  final DigitGridData data;

  const ReadonlyDigitGrid({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      mode: PlutoGridMode.readOnly,
      noRowsWidget: const Center(child: Text('No data found')),
      configuration: PlutoGridConfiguration(
        scrollbar: const PlutoGridScrollbarConfig(
          isAlwaysShown: true,
        ),
        columnSize: const PlutoGridColumnSizeConfig(
          resizeMode: PlutoResizeMode.none,
          restoreAutoSizeAfterFrozenColumn: true,
        ),
        style: PlutoGridStyleConfig(
          gridBorderColor: const DigitColors().seaShellGray,
          oddRowColor: const DigitColors().seaShellGray.withOpacity(
                0.5,
              ),
          borderColor: const DigitColors().seaShellGray,
          iconColor: Colors.transparent,
          evenRowColor: Colors.transparent,
          activatedColor: const DigitColors().burningOrange.withOpacity(
                0.2,
              ),
          activatedBorderColor: const DigitColors().burningOrange.withOpacity(
                0.8,
              ),
          enableRowColorAnimation: true,
        ),
      ),
      columns: [
        ...data.columns.map(
          (e) => PlutoColumn(
            title: e.label,
            field: e.key,
            type: PlutoColumnType.text(),
            enableContextMenu: false,
            enableColumnDrag: false,
            width: e.width,
          ),
        ),
        PlutoColumn(
          cellPadding: EdgeInsets.zero,
          title: 'Date',
          field: 'date',
          type: PlutoColumnType.text(),
          enableContextMenu: false,
          enableColumnDrag: false,
          width: 100,
          frozen: PlutoColumnFrozen.start,
          renderer: (rendererContext) => Container(
            color: Colors.white,
            child: Center(
              child: Text(
                rendererContext.cell.value.toString(),
              ),
            ),
          ),
        ),
        PlutoColumn(
          title: 'Quantity',
          field: 'quantity',
          type: PlutoColumnType.text(),
          width: 100,
          enableContextMenu: false,
          enableColumnDrag: false,
        ),
        PlutoColumn(
          title: 'Received From',
          field: 'received_from',
          type: PlutoColumnType.text(),
          width: 200,
          enableContextMenu: false,
          enableColumnDrag: false,
        ),
        PlutoColumn(
          title: 'Bill Date',
          field: 'bill_date',
          type: PlutoColumnType.text(),
          width: 100,
          enableContextMenu: false,
          enableColumnDrag: false,
        ),
        PlutoColumn(
          title: 'Paid Date',
          field: 'paid_date',
          type: PlutoColumnType.text(),
          width: 100,
          enableContextMenu: false,
          enableColumnDrag: false,
        ),
      ],
      rows: [
        PlutoRow(
          cells: {
            'date': PlutoCell(value: '2021-09-01'),
            'quantity': PlutoCell(value: '10'),
            'received_from': PlutoCell(value: 'John Doe'),
            'bill_date': PlutoCell(value: '2021-09-01'),
            'paid_date': PlutoCell(value: '2021-09-01'),
          },
        ),
        PlutoRow(
          cells: {
            'date': PlutoCell(value: '2021-09-01'),
            'quantity': PlutoCell(value: '10'),
            'received_from': PlutoCell(value: 'John Doe'),
            'bill_date': PlutoCell(value: '2021-09-01'),
            'paid_date': PlutoCell(value: '2021-09-01'),
          },
        ),
        PlutoRow(
          cells: {
            'date': PlutoCell(value: '2021-09-01'),
            'quantity': PlutoCell(value: '10'),
            'received_from': PlutoCell(value: 'John Doe'),
            'bill_date': PlutoCell(value: '2021-09-01'),
            'paid_date': PlutoCell(value: '2021-09-01'),
          },
        ),
        PlutoRow(
          cells: {
            'date': PlutoCell(value: '2021-09-01'),
            'quantity': PlutoCell(value: '10'),
            'received_from': PlutoCell(value: 'John Doe'),
            'bill_date': PlutoCell(value: '2021-09-01'),
            'paid_date': PlutoCell(value: '2021-09-01'),
          },
        ),
        PlutoRow(
          cells: {
            'date': PlutoCell(value: '2021-09-01'),
            'quantity': PlutoCell(value: '10'),
            'received_from': PlutoCell(value: 'John Doe'),
            'bill_date': PlutoCell(value: '2021-09-01'),
            'paid_date': PlutoCell(value: '2021-09-01'),
          },
        ),
        PlutoRow(
          cells: {
            'date': PlutoCell(value: '2021-09-01'),
            'quantity': PlutoCell(value: '10'),
            'received_from': PlutoCell(value: 'John Doe'),
            'bill_date': PlutoCell(value: '2021-09-01'),
            'paid_date': PlutoCell(value: '2021-09-01'),
          },
        ),
        PlutoRow(
          cells: {
            'date': PlutoCell(value: '2021-09-01'),
            'quantity': PlutoCell(value: '10'),
            'received_from': PlutoCell(value: 'John Doe'),
            'bill_date': PlutoCell(value: '2021-09-01'),
            'paid_date': PlutoCell(value: '2021-09-01'),
          },
        ),
        PlutoRow(
          cells: {
            'date': PlutoCell(value: '2021-09-01'),
            'quantity': PlutoCell(value: '10'),
            'received_from': PlutoCell(value: 'John Doe'),
            'bill_date': PlutoCell(value: '2021-09-01'),
            'paid_date': PlutoCell(value: '2021-09-01'),
          },
        ),
        PlutoRow(
          cells: {
            'date': PlutoCell(value: '2021-09-01'),
            'quantity': PlutoCell(value: '10'),
            'received_from': PlutoCell(value: 'John Doe'),
            'bill_date': PlutoCell(value: '2021-09-01'),
            'paid_date': PlutoCell(value: '2021-09-01'),
          },
        ),
        PlutoRow(
          cells: {
            'date': PlutoCell(value: '2021-09-01'),
            'quantity': PlutoCell(value: '10'),
            'received_from': PlutoCell(value: 'John Doe'),
            'bill_date': PlutoCell(value: '2021-09-01'),
            'paid_date': PlutoCell(value: '2021-09-01'),
          },
        ),
        PlutoRow(
          cells: {
            'date': PlutoCell(value: '2021-09-01'),
            'quantity': PlutoCell(value: '10'),
            'received_from': PlutoCell(value: 'John Doe'),
            'bill_date': PlutoCell(value: '2021-09-01'),
            'paid_date': PlutoCell(value: '2021-09-01'),
          },
        ),
      ],
    );
  }
}

class DigitGridData {
  final List<DigitGridColumn> columns;
  final List<DigitGridRow> rows;

  DigitGridData({
    required this.columns,
    this.rows = const [],
  }) : assert(rows.every((e) => e.cells.length == columns.length));
}

class DigitGridColumn {
  final String label;
  final String key;
  final double width;

  const DigitGridColumn({
    required this.label,
    required this.key,
    this.width = 100,
  });
}

class DigitGridRow {
  final List<DigitGridCell> cells;

  DigitGridRow(this.cells);
}

class DigitGridCell {
  final String key;
  final String value;

  const DigitGridCell({
    required this.key,
    required this.value,
  });
}
