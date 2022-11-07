import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/forms_engine.dart';
import '../router/app_router.dart';

mixin StaticData {
  // ignore: long-method
  void loadStaticData(BuildContext context, pageName) {
    context.read<WalkthroughBloc>().add(WalkthroughEvent.loadWalkthrough(
          walkthroughData:
              DigitIconCardWrapperModel(digiticoncards: <DigitIconCardModel>[
            DigitIconCardModel(
              title: 'Registration',
              callback: pageName == null
                  ? null
                  : () => context.router.push(
                        FormsRoute(
                          pageName: pageName,
                        ),
                      ),
              icon: 0xe44a,
              subtitle: 'Register Households by filling forms',
              widgetKey: 'REGISTRATION_ICON_KEY',
            ),
            const DigitIconCardModel(
              title: 'View Beneficiaries',
              callback: null,
              icon: 0xe07d,
              subtitle: 'View Reports on this Screen',
              widgetKey: 'BENEFICIARIES_ICON_KEY',
            ),
            const DigitIconCardModel(
              title: 'View Reports',
              callback: null,
              icon: 0xe3dd,
              subtitle: 'View Reports on this Screen',
              widgetKey: 'REPORTS_ICON_KEY',
            ),
            DigitIconCardModel(
              title: 'Sync Data',
              callback: () =>
                  context.read<FormsBloc>().add(const FormsLoadEvent()),
              icon: 0xe630,
              subtitle: 'View sync Data on this Screen',
              widgetKey: 'SYNC_ICON_KEY',
            ),
            const DigitIconCardModel(
              title: 'Call Supervisor',
              callback: null,
              icon: 0xe052,
              subtitle: 'call to Supervisor  by clicking',
              widgetKey: 'CALL_SUP_ICON_KEY',
            ),
            const DigitIconCardModel(
              title: 'File Complaint',
              callback: null,
              icon: 0xe087,
              subtitle: 'File a Complaint by clicking',
              widgetKey: 'FILE_COMPLAINT_ICON_KEY',
            ),
          ]),
        ));
  }
}
