import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data/data_repository.dart';
import 'package:digit_data_model/data/repositories/package_repository/remote/unique_id_pool.dart';
import 'package:digit_data_model/models/entities/unique_id_pool.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/localization/app_localization.dart';
import '../../blocs/unique_beneficiary_id/unique_id.dart';
import '../../utils/environment_config.dart';
import '../../utils/extensions/extensions.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import 'id_count_popup.dart';

@RoutePage()
class BeneficiaryIdDownSyncPage extends LocalizedStatefulWidget {
  const BeneficiaryIdDownSyncPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<BeneficiaryIdDownSyncPage> createState() =>
      _BeneficiaryIdDownSyncState();
}

class _BeneficiaryIdDownSyncState extends State<BeneficiaryIdDownSyncPage> {
  int beneficiaryIdCount = 0, beneficiaryIdTotalCount = 0;
  bool _isProgressDialogVisible = false;
  final ProgressDialog _progressDialog = ProgressDialog();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _progressDialog.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return BlocBuilder<AppInitializationBloc, AppInitializationState>(
      builder: (context, initState) {
        return initState.maybeWhen(
          orElse: () => const Offstage(),
          initialized: (appConfiguration, _, __) {
            final beneficiaryIdMinCount =
                appConfiguration.beneficiaryIdConfig?.first.minCount.toInt() ??
                    0;
            final beneficiaryIdBatchSize =
                appConfiguration.beneficiaryIdConfig?.first.batchSize.toInt() ??
                    10;
            final tenantId = envConfig.variables.tenantId;

            return BlocProvider<UniqueIdBloc>(
              create: (context) {
                return UniqueIdBloc(
                  uniqueIdPoolLocalRepository: context.read<
                      LocalRepository<UniqueIdPoolModel,
                          UniqueIdPoolSearchModel>>(),
                  uniqueIdPoolRemoteRepository:
                      context.read<UniqueIdPoolRemoteRepository>(),
                  userUuid: context.loggedInUserUuid,
                  beneficiaryIdMinCount: beneficiaryIdMinCount,
                  beneficiaryIdBatchSize: beneficiaryIdBatchSize,
                  tenantId: tenantId,
                )..add(const UniqueIdEvent.fetchIdCount());
              },
              child: BlocListener<UniqueIdBloc, UniqueIdState>(
                listener: (context, state) {
                  state.maybeWhen(
                      orElse: () {},
                      idCount: (availableCount, totalCount) {
                        _progressDialog.closeProgressDialog();
                        _isProgressDialogVisible = false;
                        beneficiaryIdCount = availableCount;
                        beneficiaryIdTotalCount = totalCount;
                      },
                      ids: (ids) {
                        _isProgressDialogVisible = false;
                      },
                      fetching: (currentCount, totalCount) {
                        if (_isProgressDialogVisible == false) {
                          _progressDialog.showProgressDialog(
                            context: context,
                            localizations: AppLocalizations.of(context),
                            currentCount: currentCount,
                            totalCount: totalCount,
                            theme: theme,
                          );
                          _isProgressDialogVisible = true;
                        } else {
                          _progressDialog.updateProgressDialog(
                            currentCount: currentCount,
                            totalCount: totalCount,
                          );
                        }
                      },
                      failed: (String? error) {
                        _progressDialog.closeProgressDialog();
                        _isProgressDialogVisible = false;
                        if (error != null) {
                          Toast.showToast(context,
                              message: localizations.translate(
                                i18.beneficiaryId.failedBeneficiaryIds,
                              ),
                              type: ToastType.error);
                        }
                      },
                      limitExceeded: (String? error) {
                        _progressDialog.closeProgressDialog();
                        _isProgressDialogVisible = false;
                        if (error != null) {
                          showCustomPopup(
                              context: context,
                              builder: (ctx) {
                                return Popup(
                                  type: PopUpType.alert,
                                  onCrossTap: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  actions: [
                                    DigitButton(
                                      capitalizeLetters: false,
                                      type: DigitButtonType.primary,
                                      size: DigitButtonSize.large,
                                      mainAxisSize: MainAxisSize.max,
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                        context.read<UniqueIdBloc>().add(
                                              const UniqueIdEvent
                                                  .fetchUniqueIdsFromServer(
                                                  reFetch: true),
                                            );
                                      },
                                      label: localizations.translate(i18
                                          .beneficiaryId.beneficiaryIdsReFetch),
                                    ),
                                    DigitButton(
                                      capitalizeLetters: false,
                                      type: DigitButtonType.secondary,
                                      size: DigitButtonSize.large,
                                      mainAxisSize: MainAxisSize.max,
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      label: localizations.translate(
                                        i18.common.corecommonclose,
                                      ),
                                    ),
                                  ],
                                  title: localizations.translate(i18
                                      .beneficiaryId.beneficiaryIdsLimitError),
                                );
                              });
                        }
                      },
                      noInternet: () {
                        _progressDialog.closeProgressDialog();
                        _isProgressDialogVisible = false;
                        showCustomPopup(
                            context: context,
                            builder: (ctx) {
                              return Popup(
                                type: PopUpType.alert,
                                onCrossTap: () {
                                  Navigator.of(ctx).pop();
                                },
                                actions: [
                                  DigitButton(
                                    capitalizeLetters: false,
                                    type: DigitButtonType.primary,
                                    size: DigitButtonSize.large,
                                    mainAxisSize: MainAxisSize.max,
                                    onPressed: () {
                                      Navigator.of(ctx).pop();

                                      context.read<UniqueIdBloc>().add(
                                            const UniqueIdEvent
                                                .fetchUniqueIdsFromServer(),
                                          );
                                    },
                                    label: localizations.translate(
                                      i18.common.coreCommonDataSyncRetry,
                                    ),
                                  ),
                                  DigitButton(
                                    capitalizeLetters: false,
                                    type: DigitButtonType.secondary,
                                    size: DigitButtonSize.large,
                                    mainAxisSize: MainAxisSize.max,
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    label: localizations.translate(
                                      i18.common.corecommonclose,
                                    ),
                                  ),
                                ],
                                title: localizations
                                    .translate(i18.home.coreCommonNoInternet),
                                description: localizations.translate(i18
                                    .beneficiaryId
                                    .noInternetBeneficiaryIdsText),
                              );
                            });
                      });
                },
                child: BlocBuilder<UniqueIdBloc, UniqueIdState>(
                    builder: (context, state) {
                  return Scaffold(
                    body: ScrollableContent(
                      enableFixedDigitButton: true,
                      header: const Column(children: [
                        BackNavigationHelpHeaderWidget(),
                      ]),
                      footer: DigitCard(
                          margin: const EdgeInsets.only(top: spacer2),
                          children: [
                            DigitButton(
                              isDisabled:
                                  beneficiaryIdCount > beneficiaryIdMinCount,
                              label: localizations.translate(
                                  i18.beneficiaryId.downloadBeneficiaryIds),
                              type: DigitButtonType.primary,
                              size: DigitButtonSize.large,
                              mainAxisSize: MainAxisSize.max,
                              capitalizeLetters: false,
                              onPressed: () async {
                                context.read<UniqueIdBloc>().add(
                                      const UniqueIdEvent
                                          .fetchUniqueIdsFromServer(),
                                    );
                              },
                            ),
                          ]),
                      children: [
                        Center(
                          child: BeneficiaryIDGauge(
                            idCount: beneficiaryIdCount,
                            totalCount: beneficiaryIdTotalCount,
                            beneficiaryMinCount: beneficiaryIdMinCount,
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            );
          },
        );
      },
    );
  }
}

class BeneficiaryIDGauge extends LocalizedStatefulWidget {
  final int idCount, totalCount, beneficiaryMinCount; // Value between 0 to 100

  const BeneficiaryIDGauge(
      {super.key,
      required this.idCount,
      required this.totalCount,
      required this.beneficiaryMinCount});

  @override
  State<BeneficiaryIDGauge> createState() => _BeneficiaryIDGaugeState();
}

class _BeneficiaryIDGaugeState extends State<BeneficiaryIDGauge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation =
        Tween<double>(begin: 0, end: double.tryParse('${widget.idCount}'))
            .animate(_controller);
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant BeneficiaryIDGauge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.idCount != oldWidget.idCount) {
      _animation = Tween<double>(
              begin: _animation.value, end: double.parse('${widget.idCount}'))
          .animate(_controller);
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double gaugeSize = screenWidth * 0.8;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: spacer5, left: spacer4),
          child: Text(
              localizations.translate(i18.beneficiaryId.beneficiaryIdsLabel),
              style: textTheme.headingL.copyWith(
                  fontSize: 24, color: theme.colorTheme.primary.primary2)),
        ),
        DigitCard(margin: const EdgeInsets.only(top: spacer5), children: [
          Container(
            width: gaugeSize,
            height: gaugeSize * 0.6,
            margin: const EdgeInsets.all(spacer5),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return CustomPaint(
                  painter: GaugePainter(
                      currentValue: widget.idCount,
                      maxValue: widget.totalCount,
                      minValue: widget.beneficiaryMinCount,
                      theme: theme),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: gaugeSize * 0.2),
                        Text(_animation.value.toInt().toString(),
                            style: textTheme.headingL.copyWith(
                                fontSize: 50,
                                color:
                                    widget.idCount <= widget.beneficiaryMinCount
                                        ? theme.colorTheme.alert.error
                                        : theme.colorTheme.primary.primary2)),
                        Text(
                            localizations.translate(
                                i18.beneficiaryId.noOfBeneficiaryIdsLeft),
                            style: textTheme.bodyS.copyWith(
                                fontSize: 14,
                                color:
                                    widget.idCount <= widget.beneficiaryMinCount
                                        ? theme.colorTheme.alert.error
                                        : theme.colorTheme.primary.primary2)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (widget.idCount <= widget.beneficiaryMinCount)
            InfoCard(
                title: localizations
                    .translate(i18.beneficiaryId.lowBeneficiaryIdsLabel),
                type: InfoType.error,
                capitalizedLetter: false,
                description: localizations
                    .translate(i18.beneficiaryId.lowBeneficiaryIdsText)),
          DigitCard(margin: const EdgeInsets.all(spacer1), children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    localizations.translate(
                        i18.beneficiaryId.availableBeneficiaryIdsText),
                    style: textTheme.bodyS
                        .copyWith(color: theme.colorTheme.primary.primary2)),
                AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Text(_animation.value.toInt().toString(),
                          style: textTheme.headingL.copyWith(
                              color: theme.colorTheme.primary.primary2));
                    })
              ],
            ),
            Divider(
              color: theme.colorTheme.text.disabled,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    localizations
                        .translate(i18.beneficiaryId.totalBeneficiaryIds),
                    style: textTheme.bodyS
                        .copyWith(color: theme.colorTheme.primary.primary2)),
                Text(widget.totalCount.toString(),
                    style: textTheme.headingL
                        .copyWith(color: theme.colorTheme.primary.primary2)),
              ],
            ),
          ])
        ])
      ],
    );
  }
}

class GaugePainter extends CustomPainter {
  final int currentValue, maxValue, minValue;
  final ThemeData theme;

  GaugePainter(
      {required this.currentValue,
      required this.maxValue,
      required this.theme,
      required this.minValue});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 20;
    double radius = size.width / 2;
    Offset center =
        Offset(size.width / 2, size.height * 0.8); // Lower arc position

    Paint backgroundPaint = Paint()
      ..color = theme.colorTheme.text.disabled
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint progressPaint = Paint()
      ..color = currentValue <= minValue
          ? theme.colorTheme.alert.error
          : theme.colorTheme.alert.success
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double startAngle = pi; // 180° (left side)
    double sweepAngle = pi *
        (currentValue /
            (maxValue == 0
                ? 100
                : maxValue)); // Moves from left → center → right

    // Full background arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      pi,
      false,
      backgroundPaint,
    );

    // Progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );

    // Circular knob (indicator)
    Paint circlePaint = Paint()
      ..color = theme.colorTheme.paper.primary
      ..style = PaintingStyle.fill;

    Paint borderPaint = Paint()
      ..color = currentValue <= minValue
          ? theme.colorTheme.alert.error
          : theme.colorTheme.alert.success
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    // Knob position based on sweepAngle
    double knobAngle = startAngle + sweepAngle;
    Offset knobPosition = Offset(
      center.dx + radius * cos(knobAngle),
      center.dy + radius * sin(knobAngle),
    );

    // Draw knob
    canvas.drawCircle(knobPosition, 10, circlePaint);
    canvas.drawCircle(knobPosition, 10, borderPaint);
  }

  @override
  bool shouldRepaint(GaugePainter oldDelegate) {
    return oldDelegate.currentValue != currentValue;
  }
}
