import 'dart:convert';

import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Tables a flow typically writes to, in the order records are created.
const _tables = [
  'household',
  'individual',
  'name',
  'identifier',
  'address',
  'household_member',
  'project_beneficiary',
  'task',
  'side_effect',
  'referral',
  'h_f_referral',
  'stock',
  'stock_reconciliation',
  'pgr_service',
];

/// Shows what the flows saved into the in-memory preview database, so
/// reviewers can check a form's answers landed in the right records/fields.
Future<void> showRecordsPanel(BuildContext context) async {
  final sql = context.read<LocalSqlDataStore>();
  final result = <String, List<Map<String, Object?>>>{};
  for (final table in _tables) {
    try {
      final rows = await sql
          .customSelect('SELECT * FROM $table ORDER BY rowid DESC LIMIT 20')
          .get();
      if (rows.isNotEmpty) result[table] = [for (final r in rows) r.data];
    } catch (_) {
      // Table not in this schema version; skip it.
    }
  }
  if (!context.mounted) return;
  await showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Saved records (this page session)'),
      content: SizedBox(
        width: 720,
        child: result.isEmpty
            ? const Text('Nothing saved yet. Submit a form to see the records '
                'it creates.')
            : ListView(
                shrinkWrap: true,
                children: [
                  for (final entry in result.entries)
                    ExpansionTile(
                      title: Text('${entry.key} (${entry.value.length})'),
                      children: [
                        for (final row in entry.value)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                            child: SelectableText(
                              const JsonEncoder.withIndent('  ').convert({
                                for (final e in row.entries)
                                  if (e.value != null) e.key: e.value,
                              }),
                              style: const TextStyle(
                                  fontFamily: 'monospace', fontSize: 12),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close')),
      ],
    ),
  );
}
