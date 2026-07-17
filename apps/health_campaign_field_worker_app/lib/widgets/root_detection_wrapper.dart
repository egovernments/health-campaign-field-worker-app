import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_security.dart';
import '../blocs/root_detection/root_detection.dart';
import 'localized.dart';
import '../utils/i18_key_constants.dart' as i18;

class RootDetectionWrapper extends LocalizedStatefulWidget {
  final Widget child;
  const RootDetectionWrapper({
    super.key,
    required this.child,
  });

  @override
  State<RootDetectionWrapper> createState() => _RootDetectionWrapperState();
}

class _RootDetectionWrapperState extends LocalizedState<RootDetectionWrapper> {
  bool isDialogShown = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootDetectionBloc, RootDetectionState>(
      builder: (context, state) {
        if (state.isRooted != null &&
            AppSecurity.instance.securityLevel.index >=
                AppSecurityLevel.medium.index) {
          if (context.mounted &&
              state.isRooted == true &&
              isDialogShown == false) {
            isDialogShown = true;
            WidgetsBinding.instance.addPostFrameCallback((value) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return PopScope(
                      canPop: false,
                      child: AlertDialog(
                        title: Text(localizations.translate(
                          localizations
                              .translate(i18.common.rootedDeviceDetectedTitle),
                        )),
                        content: Text(localizations.translate(
                          i18.common.rootedDeviceDetectedMessage,
                        )),
                        actions: [
                          DigitButton(
                            onPressed: () {
                              isDialogShown = false;
                              Navigator.of(context).pop();
                              SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop');
                            },
                            label: localizations.translate(i18.common.exitApp),
                            type: DigitButtonType.primary,
                            size: DigitButtonSize.large,
                          ),
                        ],
                      ),
                    );
                  });
            });
          }
        }
        return widget.child;
      },
    );
  }
}
