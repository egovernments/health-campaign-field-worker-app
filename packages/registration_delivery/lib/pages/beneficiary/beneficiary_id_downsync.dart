import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data/data_repository.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:registration_delivery/blocs/unique_id/unique_id.dart';
import 'package:registration_delivery/models/entities/unique_id_pool.dart';

import '../../blocs/app_localization.dart';
import '../../utils/constants.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';

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
  int beneficiaryIdCount = 0,
      beneficiaryIdTotalCount = 100,
      beneficiaryMinCount = 10;
  bool _isProgressDialogVisible = false;
  BuildContext? _progressDialogContext;

  @override
  void initState() {
    super.initState();
  }

  /// Shows the progress popup
  Future<void> _showProgressDialog(
      {required BuildContext context,
      required RegistrationDeliveryLocalization localizations,
      required int currentCount,
      required int totalCount,
      required ThemeData theme}) async {
    _isProgressDialogVisible = true;

    // Calculate the progress value (0.0 to 1.0)
    double progressValue = (currentCount) / totalCount;

    // Ensure progressValue is within the range [0.0, 1.0]
    progressValue = progressValue.clamp(0.0, 1.0);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        _progressDialogContext = ctx;
        return StatefulBuilder(
          builder: (context, setState) {
            return Popup(
              type: PopUpType.simple,
              title: localizations
                  .translate(i18.beneficiaryDetails.downloadBeneficiaryIds),
              additionalWidgets: [
                Center(
                  child: Lottie.asset(Constants.downloadAnimation,
                      height: MediaQuery.of(context).size.height * 0.1),
                ),
                Column(
                  children: [
                    LinearProgressIndicator(
                      value: progressValue,
                      minHeight: spacer1,
                      color: theme.colorTheme.alert.success,
                      // Initial value, will be updated dynamically
                      borderRadius:
                          const BorderRadius.all(Radius.circular(spacer2)),
                    ),
                    const SizedBox(height: spacer2 * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          localizations
                              .translate(i18.common.coreCommonDownloading),
                          style: TextStyle(
                            fontSize: 15,
                            color: theme.colorTheme.text.primary,
                          ),
                        ),
                        Text(
                          '$currentCount/$totalCount',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: theme.colorTheme.text.primary,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// Updates the progress in the existing popup
  void _updateProgressDialog(
      int currentCount, int totalCount, ThemeData theme) {
    if (_progressDialogContext != null) {
      Navigator.of(_progressDialogContext!).pop(); // Close existing
      _showProgressDialog(
          context: context,
          localizations: RegistrationDeliveryLocalization.of(context),
          currentCount: currentCount,
          totalCount: totalCount,
          theme: theme); // Reopen with new progress
    }
  }

  /// Closes the progress popup
  void _closeProgressDialog() {
    if (_isProgressDialogVisible && _progressDialogContext != null) {
      Navigator.of(_progressDialogContext!).pop();
      _isProgressDialogVisible = false;
      _progressDialogContext = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = RegistrationDeliveryLocalization.of(context);
    final theme = Theme.of(context);

    return BlocProvider<UniqueIdBloc>(
      create: (context) {
        return UniqueIdBloc(
            uniqueIdPoolLocalRepository: context.read<
                LocalRepository<UniqueIdPoolModel, UniqueIdPoolSearchModel>>())
          ..add(const UniqueIdEvent.fetchIdCount());
      },
      child: BlocListener<UniqueIdBloc, UniqueIdState>(
        listener: (context, state) {
          if (state is FetchedIdCountState) {
            beneficiaryIdCount = state.count;
            beneficiaryIdTotalCount = state.totalCount;
          }
          if (state is FetchedUniqueIdsState) {
            context
                .read<UniqueIdBloc>()
                .add(const UniqueIdEvent.fetchIdCount());
            _closeProgressDialog(); // Close popup when fetching is done
          }
          if (state is FetchingState) {
            state.maybeWhen(
              orElse: () {},
              fetching: (currentCount, totalCount) {
                if (!_isProgressDialogVisible) {
                  _showProgressDialog(
                      context: context,
                      localizations: localizations,
                      currentCount: currentCount,
                      totalCount: totalCount,
                      theme: theme);
                }
                // Update the existing dialog
                _updateProgressDialog(currentCount, totalCount, theme);
              },
            );
          }
          if (state is NoInternetState) {
            _closeProgressDialog(); // Close popup when fetching is done
            showCustomPopup(
                context: context,
                builder: (ctx) {
                  return Popup(
                    type: PopUpType.alert,
                    actions: [
                      DigitButton(
                        capitalizeLetters: false,
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                        mainAxisSize: MainAxisSize.max,
                        onPressed: () {
                          Navigator.of(ctx).pop();

                          context.read<UniqueIdBloc>().add(
                                const UniqueIdEvent.fetchUniqueIdsFromServer(),
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
                        .translate(i18.common.coreCommonNoInternet),
                    description: localizations.translate(
                        i18.beneficiaryDetails.noInternetBeneficiaryIdsText),
                  );
                });
          }
        },
        child:
            BlocBuilder<UniqueIdBloc, UniqueIdState>(builder: (context, state) {
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
                      isDisabled: beneficiaryIdCount > beneficiaryMinCount,
                      label: localizations.translate(
                          i18.beneficiaryDetails.downloadBeneficiaryIds),
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large,
                      mainAxisSize: MainAxisSize.max,
                      capitalizeLetters: false,
                      onPressed: () async {
                        context.read<UniqueIdBloc>().add(
                              const UniqueIdEvent.fetchUniqueIdsFromServer(),
                            );
                      },
                    ),
                  ]),
              children: [
                Center(
                  child: BeneficiaryIDGauge(
                    idCount: beneficiaryIdCount,
                    totalCount: beneficiaryIdTotalCount,
                    beneficiaryMinCount: beneficiaryMinCount,
                  ),
                )
              ],
            ),
          );
        }),
      ),
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
    final localizations = RegistrationDeliveryLocalization.of(context);

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
              localizations
                  .translate(i18.beneficiaryDetails.beneficiaryIdsLabel),
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
                                    widget.idCount < widget.beneficiaryMinCount
                                        ? theme.colorTheme.alert.error
                                        : theme.colorTheme.primary.primary2)),
                        Text(
                            localizations.translate(i18.beneficiaryDetails
                                .availableBeneficiaryIdsLabel),
                            style: textTheme.bodyS.copyWith(
                                fontSize: 14,
                                color:
                                    widget.idCount < widget.beneficiaryMinCount
                                        ? theme.colorTheme.alert.error
                                        : theme.colorTheme.primary.primary2)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          widget.idCount < widget.beneficiaryMinCount
              ? InfoCard(
                  title: localizations
                      .translate(i18.beneficiaryDetails.lowBeneficiaryIdsLabel),
                  type: InfoType.error,
                  description: i18.beneficiaryDetails.lowBeneficiaryIdsText)
              : const Offstage(),
          DigitCard(margin: const EdgeInsets.all(spacer4), children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    localizations.translate(
                        i18.beneficiaryDetails.availableBeneficiaryIdsText),
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
                        .translate(i18.beneficiaryDetails.totalBeneficiaryIds),
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
      ..color = currentValue < minValue
          ? theme.colorTheme.alert.error
          : theme.colorTheme.alert.success
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double startAngle = pi; // 180° (left side)
    double sweepAngle =
        pi * (currentValue / maxValue); // Moves from left → center → right

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
      ..color = currentValue < minValue
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
