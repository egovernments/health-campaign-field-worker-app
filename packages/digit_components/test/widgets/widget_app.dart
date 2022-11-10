import 'package:digit_components/blocs/walkthrough/walkthrough.dart';
import 'package:digit_components/models/digiticoncard/digit_icon_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetApp extends StatelessWidget {
  final Widget child;
  final NavigatorObserver? navigatorObserver;

  const WidgetApp({
    super.key,
    required this.child,
    this.navigatorObserver,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WalkthroughBloc>(
            create: (BuildContext context) => WalkthroughBloc(
              const WalkthroughState(
                walkthroughData: DigitIconCardWrapperModel(
                    digitIconCards: <DigitIconCardModel>[
                      DigitIconCardModel(
                        title: 'Registration',
                        icon: 0xe44a,
                        subtitle: 'Register Households by filling forms',
                        widgetKey: 'REGISTRATION_ICON_KEY',
                      ),
                      DigitIconCardModel(
                        title: 'View Beneficiaries',
                        icon: 0xe07d,
                        subtitle: 'View Reports on this Screen',
                        widgetKey: 'BENEFICIARIES_ICON_KEY',
                      ),
                      DigitIconCardModel(
                        title: 'View Reports',
                        icon: 0xe3dd,
                        subtitle: 'View Reports on this Screen',
                        widgetKey: 'REPORTS_ICON_KEY',
                      ),
                      DigitIconCardModel(
                        title: 'Sync Data',
                        icon: 0xe630,
                        subtitle: 'View sync Data on this Screen',
                        widgetKey: 'SYNC_ICON_KEY',
                      ),
                      DigitIconCardModel(
                        title: 'Call Supervisor',
                        icon: 0xe052,
                        subtitle: 'call to Supervisor  by clicking',
                        widgetKey: 'CALL_SUP_ICON_KEY',
                      ),
                      DigitIconCardModel(
                        title: 'File Complaint',
                        icon: 0xe087,
                        subtitle: 'File a Complaint by clicking',
                        widgetKey: 'FILE_COMPLAINT_ICON_KEY',
                      ),
                    ]),
              ),
            ),
          )
        ],
        child: MaterialApp(
          navigatorObservers: [
            if (navigatorObserver != null) navigatorObserver!
          ],
          home: Scaffold(body: child),
        ));
  }
}
