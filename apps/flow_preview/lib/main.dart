import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/data_model.init.dart' as data_model_mappers;
import 'package:digit_forms_engine/forms_engine.dart';
import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_ui_components/services/location_bloc.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import 'src/app_shell.dart';
import 'src/app_actions/app_actions.dart';
import 'src/digit_account.dart';
import 'src/embed/embed.dart';
import 'src/localization.dart';
import 'src/phone_frame.dart';
import 'src/preview_location.dart';
import 'src/repositories.dart';
import 'src/router.dart';
import 'src/session.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Register digit_data_model's JSON mappers, as the app does at start-up
  // (initializeAllMappers in apps/health_campaign_field_worker_app/lib/utils/
  // utils.dart). Without this, transformers fail on nested types such as
  // HouseholdAdditionalFields and save nothing.
  data_model_mappers.initializeMappers();
  PreviewSession.apply();
  registerAppActions();
  final sql = LocalSqlDataStore();
  try {
    await seedUniqueIdPool(sql);
  } catch (e) {
    debugPrint('Preview: could not seed the beneficiary ID pool: $e');
  }
  runApp(FlowPreviewApp(sql: sql));
}

class FlowPreviewApp extends StatefulWidget {
  final LocalSqlDataStore sql;

  const FlowPreviewApp({super.key, required this.sql});

  @override
  State<FlowPreviewApp> createState() => _FlowPreviewAppState();
}

class _FlowPreviewAppState extends State<FlowPreviewApp> {
  final _router = PreviewRouter();
  final _messages = PreviewMessages();
  final _account = DigitAccount();

  @override
  void initState() {
    super.initState();
    if (isEmbedded) {
      EmbedController.instance.start(router: _router, account: _account);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocalSqlDataStore>.value(value: widget.sql),
        RepositoryProvider<PreviewMessages>.value(value: _messages),
        RepositoryProvider<DigitAccount>.value(value: _account),
      ],
      child: PreviewRepositories(
        sql: widget.sql,
        // Same app-wide blocs the field worker app provides
        // (apps/health_campaign_field_worker_app/lib/app.dart, authenticated.dart).
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => LocationBloc(
                location: Uri.base.queryParameters['gps'] == 'real'
                    ? Location()
                    : PreviewLocation(),
              ),
            ),
            BlocProvider(
                create: (_) => DigitScannerBloc(const DigitScannerState())),
            BlocProvider(create: (_) => FormsBloc()),
          ],
          child: ValueListenableBuilder<List<PreviewMessage>>(
            valueListenable: _messages,
            builder: (context, messages, _) => MaterialApp.router(
              title: 'HCM flow preview',
              debugShowCheckedModeBanner: false,
              theme: DigitExtendedTheme.instance.getLightTheme(),
              locale: previewLocale,
              supportedLocales: const [previewLocale],
              localizationsDelegates: previewLocalizationDelegates(messages),
              routerConfig: _router.config(),
              builder: (context, child) =>
                  PhoneFrame(
                      child: _PreviewBanner(
                          child: AppShell(router: _router, child: child!))),
            ),
          ),
        ),
      ),
    );
  }
}

/// Always-visible label so a screenshot of the preview is never mistaken for
/// the field worker app.
class _PreviewBanner extends StatelessWidget {
  final Widget child;

  const _PreviewBanner({required this.child});

  @override
  Widget build(BuildContext context) {
    return Banner(
      message: 'PREVIEW',
      location: BannerLocation.topEnd,
      color: Colors.deepOrange,
      child: Column(
        children: [
          Material(
            color: Colors.deepOrange.shade50,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Row(
                  children: [
                    Icon(Icons.visibility_outlined,
                        size: 16, color: Colors.deepOrange.shade900),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Preview, not the field worker app. Sample data only; '
                        'GPS, scanning and sync are simulated.',
                        style: TextStyle(
                            fontSize: 12, color: Colors.deepOrange.shade900),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
