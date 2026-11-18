import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'messages_loader.dart'
    show MessageServerSettings, fetchProjectConfigs, useDevProxy;
import 'session.dart';

/// A real DIGIT sign-in for the preview, so flows run with the user's actual
/// project, project type (cycles, eligibility) and boundary, as on a phone.
///
/// - Sign-in uses the same request as the app (AuthRepository: form-encoded
///   `user/oauth/token` with the app's client Basic header).
/// - Projects and boundaries are read with digit_data_model's own remote
///   repositories (the classes the app uses), sending the token in
///   RequestInfo as the app's AuthTokenInterceptor does.
/// - The token lives only in memory for this page; nothing is written to the
///   server and no credentials are stored.
/// - Requests go through tool/serve.py's proxy when served locally (DIGIT
///   servers block other origins via CORS).
class DigitAccount extends ChangeNotifier {
  String? _token;
  Map<String, dynamic>? _userInfo;
  String? host;
  String? tenantId;
  String? hierarchyType;
  List<ProjectModel> projects = const [];
  ProjectModel? project;

  /// The working boundary: the project's boundary until the user picks a
  /// lower level on the boundary selection screen, as in the app.
  BoundaryModel? boundary;

  /// The project's boundary and everything under it (flattened, with
  /// materializedPath), for the boundary selection screen.
  List<BoundaryModel> boundaryTree = const [];

  /// Flow configs created for the selected project (MDMS FormConfig).
  List<Map<String, dynamic>> projectConfigs = const [];
  bool loadingConfigs = false;
  String? configsError;

  bool get signedIn => _token != null;
  String get userName =>
      (_userInfo?['name'] ?? _userInfo?['userName'] ?? '').toString();
  String? get userUuid => _userInfo?['uuid'] as String?;
  List<Map<String, dynamic>> get roles => [
        for (final r in (_userInfo?['roles'] as List? ?? const []))
          {'code': r['code'], 'name': r['name']}
      ];

  UserModel? get user => _userInfo == null
      ? null
      : UserModel(
          uuid: _userInfo!['uuid'] as String?,
          userName: _userInfo!['userName'] as String?,
          name: _userInfo!['name'] as String?,
          mobileNumber: _userInfo!['mobileNumber'] as String?,
          tenantId: _userInfo!['tenantId'] as String?,
        );

  static bool get _local => useDevProxy;

  /// Paths from HCM-SERVICE-REGISTRY (same on DIGIT HCM environments).
  static const _loginPath = '/user/oauth/token';
  static const _staffSearch = '/health-project/staff/v1/_search';
  static const _projectSearch = '/health-project/v1/_search';
  static const _boundarySearch =
      '/boundary-service/boundary-relationships/_search';

  Dio _dio() {
    final base = host!.endsWith('/') ? host! : '$host/';
    final dio = Dio(BaseOptions(
      baseUrl: _local ? '${Uri.base.origin}/digit-proxy' : base.substring(0, base.length - 1),
      headers: _local ? {'X-Digit-Upstream': base} : null,
    ));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (options.data is Map) {
        options.data = {
          ...options.data as Map,
          'RequestInfo': {
            'apiId': 'hcm',
            'ver': '.01',
            'ts': DateTime.now().millisecondsSinceEpoch,
            'action': options.path.split('/').last,
            'did': '1',
            'key': '1',
            'authToken': _token,
            'userInfo': _userInfo,
            'tenantId': tenantId,
          },
        };
      }
      handler.next(options);
    }));
    return dio;
  }

  /// Signs in. [password] is sent once to the server and not kept.
  Future<void> signIn({
    required String username,
    required String password,
    String? tenant,
  }) async {
    final s = await MessageServerSettings.load();
    host = s.host;
    tenantId = (tenant == null || tenant.isEmpty) ? s.tenant : tenant;
    hierarchyType = s.hierarchy;
    final base = host!.endsWith('/') ? host! : '$host/';
    final form = {
      'username': username,
      'password': password,
      'userType': 'EMPLOYEE',
      'tenantId': tenantId,
      'scope': 'read',
      'grant_type': 'password',
    }
        .entries
        .map((e) =>
            '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent('${e.value}')}')
        .join('&');
    final Response res;
    try {
      res = await Dio().post(
        _local ? '/digit-proxy$_loginPath' : '${base.substring(0, base.length - 1)}$_loginPath',
        data: form,
        options: Options(headers: {
          'content-type': 'application/x-www-form-urlencoded',
          // The app's public client id (AuthRepository), not a secret.
          'authorization': 'Basic ZWdvdi11c2VyLWNsaWVudDo=',
          if (_local) 'X-Digit-Upstream': base,
        }),
      );
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final body = e.response?.data;
      final reason = body is Map
          ? (body['error_description'] ?? body['error'] ?? body['message'])
          : null;
      throw Exception(reason != null
          ? 'Sign-in failed ($status): $reason'
          : status == 400 || status == 401
              ? 'Sign-in failed ($status): check the username, password and tenant.'
              : 'Sign-in failed (${status ?? e.type.name}).');
    }
    final data = res.data;
    if (data is! Map || data['access_token'] == null) {
      throw Exception('Sign-in failed: unexpected response.');
    }
    _token = data['access_token'] as String;
    _userInfo = Map<String, dynamic>.from(data['UserRequest'] as Map);
    // Searches take their tenantId from DigitDataModelSingleton.
    useTenant(tenantId!);
    notifyListeners();
  }

  /// Embed mode: uses the session of the page hosting the preview (the
  /// campaign console) instead of signing in again. [userInfo] is DIGIT's
  /// user object (uuid, userName, name, mobileNumber, tenantId, roles).
  void adoptSession({
    required String host,
    required String tenantId,
    required String token,
    required Map<String, dynamic> userInfo,
    String? hierarchyType,
  }) {
    this.host = host;
    this.tenantId = tenantId;
    if (hierarchyType != null) this.hierarchyType = hierarchyType;
    _token = token;
    _userInfo = userInfo;
    useTenant(tenantId);
    notifyListeners();
  }

  /// Embed mode: the campaign's project by its referenceID (the console's
  /// campaignNumber), without needing a staff assignment. A campaign has one
  /// project per boundary; the root one (no parent) is used.
  Future<ProjectModel> loadProjectByReference(String referenceId) async {
    if (!signedIn) throw StateError('Not signed in');
    final repo = ProjectRemoteRepository(_dio(),
        actionMap: {ApiOperation.search: _projectSearch});
    final found = await repo.search(
        ProjectSearchModel(referenceID: referenceId, tenantId: tenantId));
    if (found.isEmpty) {
      throw Exception('No project found for campaign $referenceId.');
    }
    final root = found.firstWhereOrNull(
            (p) => p.parent == null || p.parent!.isEmpty) ??
        found.first;
    projects = [root];
    notifyListeners();
    return root;
  }

  /// Unsaved configs sent by the host page, by module name. On the home
  /// screen they replace the saved FormConfig of the same name.
  final Map<String, Map<String, dynamic>> draftConfigs = {};

  void setDraftConfig(Map<String, dynamic> config) {
    draftConfigs[(config['name'] ?? 'Preview').toString()] = config;
    notifyListeners();
  }

  /// Saved configs with drafts in place of (or added to) them.
  List<Map<String, dynamic>> get homeConfigs {
    if (draftConfigs.isEmpty) return projectConfigs;
    final out = [
      for (final c in projectConfigs)
        draftConfigs[(c['name'] ?? '').toString()] ?? c,
    ];
    final saved = {for (final c in projectConfigs) (c['name'] ?? '').toString()};
    out.addAll(draftConfigs.entries
        .where((e) => !saved.contains(e.key))
        .map((e) => e.value));
    return out;
  }

  void signOut() {
    _token = null;
    _userInfo = null;
    projects = const [];
    project = null;
    boundary = null;
    projectConfigs = const [];
    draftConfigs.clear();
    configsError = null;
    boundaryTree = const [];
    PreviewSession.apply();
    notifyListeners();
  }

  /// The user's projects, the way the app's ProjectBloc loads them: staff
  /// records for the user, then each project by id.
  Future<List<ProjectModel>> loadProjects() async {
    final uuid = userUuid;
    if (!signedIn || uuid == null) throw StateError('Not signed in');
    final dio = _dio();
    final staffRepo = ProjectStaffRemoteRepository(dio,
        actionMap: {ApiOperation.search: _staffSearch});
    final projectRepo = ProjectRemoteRepository(dio,
        actionMap: {ApiOperation.search: _projectSearch});
    final staff = await staffRepo.search(ProjectStaffSearchModel(staffId: [uuid]));
    final found = <ProjectModel>[];
    for (final s in staff.whereNot((e) => e.projectId == null)) {
      found.addAll(await projectRepo.search(
          ProjectSearchModel(id: s.projectId, tenantId: s.tenantId ?? tenantId)));
    }
    projects = found.toSet().toList()
      ..sort((a, b) => (a.name).compareTo(b.name));
    notifyListeners();
    return projects;
  }

  /// Picks [p] and loads its boundary (code and name) the way the app does:
  /// boundary-relationships search for the project's boundary code in the
  /// project's hierarchy.
  Future<void> selectProject(ProjectModel p) async {
    project = p;
    final hierarchy = p.additionalDetails?.hierarchyType ?? hierarchyType;
    if (hierarchy != null) DigitDataModelSingleton().setHierarchyType(hierarchy);
    boundary = null;
    boundaryTree = const [];
    final code = p.address?.boundary;
    if (code != null) {
      try {
        final repo = BoundaryRemoteRepository(_dio(),
            actionMap: {ApiOperation.search: _boundarySearch});
        final list = await repo.search(BoundarySearchModel(
          codes: code,
          boundaryType: p.address?.boundaryType,
          hierarchyType: hierarchy,
          tenantId: tenantId,
        ));
        boundaryTree = list;
        boundary = list.firstWhereOrNull((b) => b.code == code) ??
            list.firstOrNull;
      } catch (e) {
        debugPrint('Preview: boundary search failed: $e');
      }
      boundary ??= BoundaryModel(
          code: code,
          name: code,
          boundaryType: p.address?.boundaryType,
          tenantId: tenantId);
    }
    notifyListeners();
    await loadProjectConfigs();
  }

  /// Pulls every FormConfig created for the selected project.
  Future<void> loadProjectConfigs() async {
    final ref = project?.referenceID;
    projectConfigs = const [];
    configsError = null;
    if (ref == null) {
      configsError = 'This project has no reference ID, so its configs cannot be found.';
      notifyListeners();
      return;
    }
    loadingConfigs = true;
    notifyListeners();
    try {
      projectConfigs = await fetchProjectConfigs(ref, tenantId: tenantId);
    } catch (e) {
      configsError = 'Could not load configs for $ref: $e';
    } finally {
      loadingConfigs = false;
      notifyListeners();
    }
  }

  /// Sets the working boundary chosen on the boundary selection screen.
  void selectBoundary(BoundaryModel b) {
    boundary = b;
    notifyListeners();
  }

  /// The selected project's type (cycles, deliveries, eligibility), as the
  /// app reads it (context.selectedProjectType).
  ProjectTypeModel? get projectType => project?.additionalDetails?.projectType;
}
