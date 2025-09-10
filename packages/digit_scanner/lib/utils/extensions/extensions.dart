// Extension to remove duplicates from a list based on a provided constraint.
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

extension UniqueListItem<E> on List<E> {
  void removeDuplicates<I>(I Function(E element) constraintMapper) {
    final distinctList = map(constraintMapper).toSet();

    retainWhere((element) => distinctList.remove(constraintMapper(element)));
  }
}
extension GS1Display on GS1Barcode {
  /// Prefer common IDs when available, else fall back to the first AI in the data.
  String? displayValue({List<String> prefer = const ['01', '02', '00', '21', '240']}) {
    for (final k in prefer) {
      final el = elements[k];
      final v = el?.data?.toString().trim();
      if (v != null && v.isNotEmpty) return v;
    }
    if (elements.isEmpty) return null;
    final first = elements.entries.first.value.data?.toString().trim();
    return (first == null || first.isEmpty) ? null : first;
  }
}