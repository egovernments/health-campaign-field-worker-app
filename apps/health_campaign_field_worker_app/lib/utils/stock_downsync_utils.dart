import 'dart:async';

import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/component_utils.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/stock_downsync/stock_downsync.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../router/app_router.dart';
import '../widgets/progress_indicator/progress_indicator.dart';
import 'constants.dart';
import 'extensions/extensions.dart';

/// Trigger stock downsync flow. Can be called from home page card or notification handler.
void triggerStockDownSync(BuildContext context) {
  context.read<AppInitializationBloc>().state.maybeWhen(
        orElse: () {},
        initialized: (AppConfiguration appConfiguration, _, __) {
          context.read<StockDownSyncBloc>().add(
                StockDownSyncGetBatchSizeEvent(
                  appConfiguration: [appConfiguration],
                  projectModel: context.selectedProject,
                ),
              );
        },
      );
}

void showStockDownloadDialog(
  BuildContext context, {
  required DownloadBeneficiary model,
  required DigitProgressDialogType dialogType,
  bool isPop = true,
  StreamController<double>? downloadProgressController,
}) {
  if (isPop) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  switch (dialogType) {
    case DigitProgressDialogType.failed:
    case DigitProgressDialogType.checkFailed:
      DigitSyncDialog.show(
        context,
        type: DialogType.failed,
        label: model.title,
        primaryAction: DigitDialogActions(
          label: model.primaryButtonLabel ?? '',
          action: (ctx) {
            Navigator.of(context, rootNavigator: true).pop();
            context.read<StockDownSyncBloc>().add(
                  StockDownSyncGetBatchSizeEvent(
                    appConfiguration: [model.appConfiguartion!],
                    projectModel: model.projectModel,
                  ),
                );
          },
        ),
        secondaryAction: DigitDialogActions(
          label: model.secondaryButtonLabel ?? '',
          action: (ctx) {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.replaceAll([HomeRoute()]);
          },
        ),
      );
    case DigitProgressDialogType.dataFound:
    case DigitProgressDialogType.insufficientStorage:
      showCustomPopup(
        context: context,
        builder: (ctx) => Popup(
          title: model.title,
          titleIcon: Icon(
            dialogType == DigitProgressDialogType.insufficientStorage
                ? Icons.warning
                : Icons.info_outline_rounded,
            color: dialogType == DigitProgressDialogType.insufficientStorage
                ? Theme.of(context).colorTheme.alert.error
                : Theme.of(context).colorTheme.text.primary,
          ),
          description: model.content,
          actions: [
            DigitButton(
              label: model.primaryButtonLabel ?? '',
              onPressed: () {
                if ((model.totalCount ?? 0) > 0) {
                  context.read<StockDownSyncBloc>().add(
                        StockDownSyncDownloadEvent(
                          projectModel: model.projectModel,
                          batchSize: model.batchSize ?? 1,
                          initialServerCount: model.totalCount ?? 0,
                        ),
                      );
                } else {
                  Navigator.of(context, rootNavigator: true).pop();
                  context.read<StockDownSyncBloc>().add(
                        const StockDownSyncResetStateEvent(),
                      );
                }
              },
              type: DigitButtonType.primary,
              size: DigitButtonSize.medium,
            ),
            if (model.secondaryButtonLabel != null)
              DigitButton(
                label: model.secondaryButtonLabel ?? '',
                onPressed: () {
                  if (context.mounted) {
                    Navigator.of(context, rootNavigator: true).pop();
                    context.router.replaceAll([HomeRoute()]);
                  }
                },
                type: DigitButtonType.secondary,
                size: DigitButtonSize.medium,
              ),
          ],
        ),
      );
    case DigitProgressDialogType.inProgress:
      showCustomPopup(
        context: context,
        builder: (ctx) => Popup(
          title: "",
          additionalWidgets: [
            StreamBuilder<double>(
              stream: downloadProgressController?.stream,
              builder: (context, snapshot) {
                return ProgressIndicatorContainer(
                  label: '',
                  prefixLabel: '',
                  suffixLabel:
                      '${(snapshot.data == null ? 0 : snapshot.data! * model.totalCount!.toDouble()).toInt()}/${model.suffixLabel}',
                  value: snapshot.data ?? 0,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorTheme.primary.primary1,
                  ),
                  subLabel: model.title,
                );
              },
            ),
          ],
        ),
      );
    default:
      return;
  }
}
