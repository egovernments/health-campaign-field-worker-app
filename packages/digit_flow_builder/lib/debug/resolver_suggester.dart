/// Produces human-readable fix suggestions for failed template resolutions.
///
/// Called by [FlowDebugger.logResolver] indirectly through [utils.dart]
/// whenever a `{{...}}` template resolves to null / empty. The suggestions
/// are attached to [ResolverDebugEvent.suggestions] and rendered inline in
/// the debugger's Resolvers tab.
///
/// Pure functions only — do not touch registries, notifiers, or IO. This
/// module runs on the resolver hot path.
library resolver_suggester;

/// Entry point. Given a failing template and the context that was in
/// scope at resolution time, return zero or more human-readable
/// "did-you-mean" strings.
///
/// [input] — the raw template, e.g. "{{navigation.household.clientRefId}}".
/// [contextData] — the map that was searched. Top-level keys are candidate
///                 roots (e.g. "navigation", "formData", "item").
/// [matchedPrefix] — optional. If the resolver already narrowed which
///                   source it looked at (e.g. "navigation."), pass it so
///                   we can skip the source-typo suggestion.
List<String> suggestResolverFixes({
  required String input,
  required dynamic contextData,
  String? matchedPrefix,
}) {
  final path = _extractTemplatePath(input);
  if (path == null || path.isEmpty) return const [];
  if (contextData is! Map) return const [];

  final Map<String, dynamic> ctx = Map<String, dynamic>.from(contextData);
  final segments = path.split('.');
  if (segments.isEmpty) return const [];

  final suggestions = <String>[];

  // Segment 0: the root key (e.g. "navigation", "item", "household").
  final root = segments.first;
  if (!ctx.containsKey(root)) {
    final closest = _closestKey(root, ctx.keys);
    if (closest != null) {
      suggestions.add(
        'Root "$root" missing from resolver context. '
        'Did you mean "$closest"? '
        'Try `${_swapFirstSegment(input, closest)}`.',
      );
    } else {
      suggestions.add(
        'Root "$root" missing. Available roots: ${ctx.keys.join(', ')}. '
        'Check that an upstream action (SEARCH, TRANSFORM, or a NAVIGATION '
        'params entry) populates "$root" before this template evaluates.',
      );
    }
    return suggestions;
  }

  // Walk the remaining path and stop at the first missing segment.
  dynamic cursor = ctx[root];
  for (var i = 1; i < segments.length; i++) {
    final seg = segments[i];
    if (cursor is Map) {
      if (cursor.containsKey(seg)) {
        cursor = cursor[seg];
        continue;
      }
      final siblings = cursor.keys.map((k) => k.toString());
      final closest = _closestKey(seg, siblings);
      final parent = segments.sublist(0, i).join('.');
      if (closest != null) {
        suggestions.add(
          'Field "$seg" not found on "$parent". '
          'Did you mean "$closest"? '
          'Try `${_swapSegment(input, i, closest)}`.',
        );
      } else {
        final avail = siblings.take(6).join(', ');
        suggestions.add(
          'Field "$seg" not found on "$parent". '
          'Available fields: ${avail.isEmpty ? '(none)' : avail}.',
        );
      }
      return suggestions;
    }
    if (cursor is List) {
      // Common pattern: template says `.field` but state has a list; nudge the
      // author toward indexed access.
      suggestions.add(
        'Path "${segments.sublist(0, i).join('.')}" is a List. '
        'Templates cannot descend into a list without an index. '
        'Try `${_insertIndex(input, i)}` (index 0 for the first item).',
      );
      return suggestions;
    }
    // Cursor is a scalar — no further descent possible.
    suggestions.add(
      'Path "${segments.sublist(0, i).join('.')}" resolves to a '
      '${cursor.runtimeType} (not an object). '
      'Trailing segment "${segments.sublist(i).join('.')}" cannot be resolved.',
    );
    return suggestions;
  }

  // We walked the full path successfully but the final value was null/empty.
  // That means the KEY exists but the VALUE was not populated at this point in
  // the flow. Point the author at the upstream population.
  if (cursor == null || (cursor is String && cursor.isEmpty)) {
    suggestions.add(
      'Key "$path" exists in context but its value is ${cursor == null ? "null" : "empty"}. '
      'An upstream action reached this screen without populating it — check '
      'the NAVIGATION action\'s `data` block on the caller screen, or add a '
      'SEARCH/TRANSFORM step that writes "$path" before this template fires.',
    );
  }

  return suggestions;
}

/// Extract the path from a `{{...}}` template. Returns null if [input] is not
/// a recognizable template.
String? _extractTemplatePath(String input) {
  final trimmed = input.trim();
  if (!trimmed.startsWith('{{') || !trimmed.endsWith('}}')) return null;
  var inner = trimmed.substring(2, trimmed.length - 2).trim();
  // Strip a known source prefix so the suggester sees the raw path — the
  // logResolver call site passes matchedPrefix separately, but the input
  // itself still contains it.
  return inner;
}

String _swapFirstSegment(String input, String replacement) {
  final trimmed = input.trim();
  final inner = trimmed.substring(2, trimmed.length - 2).trim();
  final dot = inner.indexOf('.');
  final rest = dot == -1 ? '' : inner.substring(dot);
  return '{{$replacement$rest}}';
}

String _swapSegment(String input, int index, String replacement) {
  final trimmed = input.trim();
  final inner = trimmed.substring(2, trimmed.length - 2).trim();
  final parts = inner.split('.');
  if (index < 0 || index >= parts.length) return input;
  parts[index] = replacement;
  return '{{${parts.join('.')}}}';
}

String _insertIndex(String input, int index) {
  final trimmed = input.trim();
  final inner = trimmed.substring(2, trimmed.length - 2).trim();
  final parts = inner.split('.');
  if (index < 0 || index >= parts.length) return input;
  parts.insert(index, '0');
  return '{{${parts.join('.')}}}';
}

/// Levenshtein-distance-based closest key finder. Returns null if no key is
/// within a small edit distance (rough threshold: <= 2 edits, or half the
/// target length for very short keys).
String? _closestKey(String target, Iterable<dynamic> candidates) {
  String? best;
  var bestDist = 1 << 30;
  for (final c in candidates) {
    final key = c.toString();
    final d = _levenshtein(target.toLowerCase(), key.toLowerCase());
    if (d < bestDist) {
      bestDist = d;
      best = key;
    }
  }
  if (best == null) return null;
  final threshold = target.length <= 4 ? (target.length ~/ 2 + 1) : 3;
  return bestDist <= threshold ? best : null;
}

int _levenshtein(String a, String b) {
  if (a == b) return 0;
  if (a.isEmpty) return b.length;
  if (b.isEmpty) return a.length;
  final m = a.length;
  final n = b.length;
  final prev = List<int>.filled(n + 1, 0);
  final curr = List<int>.filled(n + 1, 0);
  for (var j = 0; j <= n; j++) {
    prev[j] = j;
  }
  for (var i = 1; i <= m; i++) {
    curr[0] = i;
    for (var j = 1; j <= n; j++) {
      final cost = a.codeUnitAt(i - 1) == b.codeUnitAt(j - 1) ? 0 : 1;
      var v = prev[j] + 1;
      final del = curr[j - 1] + 1;
      if (del < v) v = del;
      final sub = prev[j - 1] + cost;
      if (sub < v) v = sub;
      curr[j] = v;
    }
    for (var j = 0; j <= n; j++) {
      prev[j] = curr[j];
    }
  }
  return prev[n];
}
