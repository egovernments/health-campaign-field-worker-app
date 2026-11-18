import 'dart:convert';

/// A flow module ready to hand to FlowRegistry.
class PreviewModule {
  final String name;
  final String initialPage;
  final List<Map<String, dynamic>> flows;

  /// Project referenceID from the MDMS record, used to guess localisation
  /// module names.
  final String? project;

  const PreviewModule({
    required this.name,
    required this.initialPage,
    required this.flows,
    this.project,
  });

  List<String> get flowNames =>
      [for (final f in flows) (f['name'] ?? f['pageName'] ?? '?').toString()];
}

class ConfigError implements Exception {
  final String message;
  const ConfigError(this.message);
  @override
  String toString() => message;
}

/// Parses any of the shapes people have at hand:
/// - an MDMS search response row or record: `{"data": {"flows": [...]}}`
/// - an MDMS search response: `{"mdms": [ {...} ]}` (first record)
/// - a module: `{"name", "initialPage", "flows": [...]}`
/// - a bare list of flows, or a single flow object.
PreviewModule parseConfig(String text) {
  final dynamic json;
  try {
    json = jsonDecode(text);
  } on FormatException catch (e) {
    throw ConfigError('Not valid JSON: ${e.message}');
  }

  dynamic module = json;
  if (module is Map && module['mdms'] is List && (module['mdms'] as List).isNotEmpty) {
    module = (module['mdms'] as List).first;
  }
  if (module is Map && module['data'] is Map && module['flows'] == null) {
    module = module['data'];
  }

  final List rawFlows;
  String? name;
  String? initialPage;
  String? project;
  if (module is List) {
    rawFlows = module;
  } else if (module is Map && module['flows'] is List) {
    rawFlows = module['flows'] as List;
    name = module['name']?.toString();
    initialPage = module['initialPage']?.toString();
    project = module['project']?.toString();
  } else if (module is Map && module['screenType'] != null) {
    rawFlows = [module];
  } else {
    throw const ConfigError(
        'No flows found. Expected a module with "flows", a list of flows, or a single flow.');
  }

  final flows = <Map<String, dynamic>>[];
  for (final f in rawFlows) {
    if (f is Map) {
      flows.add(_deepCast(f) as Map<String, dynamic>);
    }
  }
  if (flows.isEmpty) {
    throw const ConfigError('The config has no flows.');
  }
  final names = [for (final f in flows) f['name']?.toString()];
  initialPage ??= names.first;
  if (!names.contains(initialPage)) {
    throw ConfigError('initialPage "$initialPage" is not one of the flows: ${names.join(', ')}');
  }
  return PreviewModule(
    name: name ?? 'Preview',
    initialPage: initialPage!,
    flows: flows,
    project: project,
  );
}

/// jsonDecode gives Map<String, dynamic> already, but configs pasted from
/// other tools can carry Map<dynamic, dynamic>; normalise everything.
dynamic _deepCast(dynamic v) {
  if (v is Map) {
    return <String, dynamic>{
      for (final e in v.entries) e.key.toString(): _deepCast(e.value)
    };
  }
  if (v is List) return [for (final e in v) _deepCast(e)];
  return v;
}
