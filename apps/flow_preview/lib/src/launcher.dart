import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:digit_crud_bloc/digit_crud_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_flow_builder/data/digit_crud_service.dart';
import 'package:digit_flow_builder/flow_builder.dart';
import 'package:digit_flow_builder/router/flow_builder_routes.gm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_actions/app_actions.dart';
import 'config_loader.dart';
import 'digit_account.dart';
import 'localization.dart';
import 'messages_loader.dart';
import 'repositories.dart';
import 'session.dart';

/// The module last opened with [launchModule] (embed mode restarts it when
/// the console sends a new draft).
PreviewModule? currentModule;

/// Opens [module] the way the field worker app opens a home-screen module:
/// session values for the user/project, MDMS options for `schemaCode`
/// fields, the CRUD service with the search graph, then the first screen.
/// Shared by the app-like home screen and the developer page.
Future<void> launchModule(
  BuildContext context,
  PreviewModule module, {
  bool loadMessages = false,
  void Function(String message)? onNote,
}) async {
  void note(String m) => onNote?.call(m);

  await applySessionFor(context, module, onNote: note);
  if (!context.mounted) return;

  if (loadMessages) {
    try {
      final list = await fetchMessagesFor(module);
      if (context.mounted) context.read<PreviewMessages>().addAll(list);
    } catch (e) {
      note('Could not load messages: $e');
    }
  }

  try {
    final result = await enrichWithMdmsOptions(module.flows);
    if (result.failed.isNotEmpty) {
      note('Could not load MDMS options for ${result.failed.join(', ')}; '
          'those fields show the options written in the config.');
    }
  } catch (_) {
    // Offline or no server: open with the options in the config.
  }
  if (!context.mounted) return;

  final beneficiaryType =
      FlowBuilderSingleton().beneficiaryType ?? BeneficiaryType.household;
  CrudBlocSingleton().setData(
    crudService: DigitCrudService(
      context: context,
      relationshipMap: previewRelationships(beneficiaryType),
      nestedModelMappings: previewNestedMappings,
      searchEntityRepository: context.read<SearchEntityRepository>(),
    ),
    dynamicEntityModelListener: EntityModelMapMapper(),
  );
  WidgetRegistry.initialize();
  // FlowRegistry ignores a list it has already seen, so always pass a copy.
  FlowRegistry.setConfig(List<Map<String, dynamic>>.of(module.flows));
  NavigationRegistry.setupNavigation(context);
  currentModule = module;
  context.router.push(FlowBuilderHomeRoute(pageName: module.initialPage));
}

/// Signed in: the real user and project (picking the project named in the
/// config when the user has it). Otherwise the sample session.
Future<void> applySessionFor(
  BuildContext context,
  PreviewModule module, {
  void Function(String message)? onNote,
}) async {
  final account = context.read<DigitAccount>();
  if (!account.signedIn) {
    PreviewSession.apply();
    return;
  }
  final ref = module.project;
  if (ref != null && account.project?.referenceID != ref) {
    final match = account.projects.firstWhereOrNull((p) => p.referenceID == ref);
    if (match != null) {
      await account.selectProject(match);
    } else if (account.project != null) {
      onNote?.call('You are not assigned to $ref; using ${account.project!.name}.');
    }
  }
  final project = account.project;
  if (project == null) {
    onNote?.call('Choose a project first; using the sample project for now.');
    PreviewSession.apply();
    return;
  }
  if (!context.mounted) return;
  await seedUniqueIdPool(context.read<LocalSqlDataStore>(),
      userUuid: account.userUuid!,
      tenantId: account.tenantId ?? PreviewSession.tenantId);
  applySignedInSession(
    tenantId: account.tenantId ?? PreviewSession.tenantId,
    userUuid: account.userUuid!,
    user: account.user,
    roles: account.roles,
    project: project,
    boundary: account.boundary,
  );
}
