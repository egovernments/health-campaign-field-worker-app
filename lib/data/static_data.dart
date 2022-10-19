import 'package:digit_components/blocs/walkthrough/walkthrough.dart';
import 'package:digit_components/models/walkthrough/walkthrough_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/forms_engine.dart';

import '../router/app_router.dart';

mixin StaticData {
  // ignore: long-method
  void loadStaticData(BuildContext context, pageName) {
    context.read<WalkthroughBloc>().add(WalkthroughEvent.loadWalkthrough(
          walkthroughData: WalkthrougWrapperModel.fromJson({
            'walkthrough': [
              {
                'title': 'Registration',
                'subtitle': 'Register Households by filling forms',
                'widgetKey': 'REGISTRATION_ICON_KEY',
                'icon': 0xe44a,
                'callback': pageName == null
                    ? null
                    : () => context.router.push(
                          FormsRoute(
                            pageName: pageName,
                          ),
                        ),
              },
              {
                'title': 'View Beneficiaries',
                'subtitle': 'View Beneficiaries on this Screen',
                'widgetKey': 'BENEFICIARIES_ICON_KEY',
                'icon': 0xe07d,
              },
              {
                'title': 'View Reports',
                'subtitle': 'View Reports on this Screen',
                'widgetKey': 'REPORTS_ICON_KEY',
                'icon': 0xe3dd,
              },
              {
                'title': 'Sync Data',
                'subtitle': 'View sync Data on this Screen',
                'widgetKey': 'SYNC_ICON_KEY',
                'icon': 0xe630,
                'callback': () =>
                    context.read<FormsBloc>().add(const FormsLoadEvent()),
              },
              {
                'title': 'Call Supervisor',
                'subtitle': 'call to Supervisor  by clicking',
                'widgetKey': 'CALL_SUP_ICON_KEY',
                'icon': 0xe052,
              },
              {
                'title': 'File Complaint',
                'subtitle': 'File a Complaint by clicking',
                'widgetKey': 'FILE_COMPLAINT_ICON_KEY',
                'icon': 0xe087,
              },
            ],
          }),
        ));
  }
}
