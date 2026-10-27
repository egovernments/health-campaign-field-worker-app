import 'package:digit_data_model/data_model.dart';
import 'package:digit_data_model/models/entities/user_action.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:transit_post/data/repositories/local/user_action.dart';

import '../router/app_router.dart';
import '../services/location_service.dart';
import '../utils/extensions/extensions.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/new_settlement_utils.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

/// Adds a settlement that is missing under [parent] at the lowest level.
///
/// Nothing is written to the boundary table. The settlement is saved as a
/// NEW_SETTLEMENT user action against [parent]'s code, and the page pops with
/// the in-memory [BoundaryModel] for the dropdown to select.
@RoutePage<BoundaryModel>()
class CreateSettlementPage extends LocalizedStatefulWidget {
  final BoundaryModel parent;
  final String label;

  /// Names already listed under [parent], for the duplicate check.
  final List<String> existingNames;

  const CreateSettlementPage({
    super.key,
    super.appLocalizations,
    required this.parent,
    required this.label,
    this.existingNames = const [],
  });

  @override
  State<CreateSettlementPage> createState() => _CreateSettlementPageState();
}

class _CreateSettlementPageState extends LocalizedState<CreateSettlementPage> {
  static const _name = 'name';

  final form = FormGroup({
    _name: FormControl<String>(validators: [Validators.required]),
  });

  LocationData? _location;
  bool _capturing = true;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _captureLocation();
  }

  Future<void> _captureLocation() async {
    setState(() => _capturing = true);
    final location = await LocationService.instance.currentOrNext(
      timeout: const Duration(seconds: 10),
    );
    if (!mounted) return;
    setState(() {
      _location = location;
      _capturing = false;
    });
  }

  bool _isDuplicate(String name) {
    final normalized = name.trim().toLowerCase();

    return widget.existingNames
        .any((existing) => existing.trim().toLowerCase() == normalized);
  }

  Future<void> _save() async {
    final name = (form.control(_name).value as String? ?? '').trim();
    if (name.isEmpty) {
      form.control(_name).setErrors({'required': true});
      form.control(_name).markAsTouched();
      return;
    }
    if (_isDuplicate(name)) {
      form.control(_name).setErrors({'duplicate': true});
      form.control(_name).markAsTouched();
      return;
    }

    final location = _location;
    if (location?.latitude == null || location?.longitude == null) return;

    setState(() => _saving = true);

    final now = DateTime.now().millisecondsSinceEpoch;
    final userUuid = context.loggedInUserUuid;
    final action = UserActionModel(
      clientReferenceId: IdGen.i.identifier,
      tenantId: context.selectedProject.tenantId,
      projectId: context.projectId,
      boundaryCode: widget.parent.code!,
      action: newSettlementAction,
      latitude: location!.latitude!,
      longitude: location.longitude!,
      locationAccuracy: location.accuracy ?? 0,
      timestamp: now,
      additionalFields: UserActionAdditionalFields(
        version: 1,
        fields: [AdditionalField(settlementNameKey, name)],
      ),
      clientAuditDetails: ClientAuditDetails(
        createdBy: userUuid,
        createdTime: now,
        lastModifiedBy: userUuid,
        lastModifiedTime: now,
      ),
      auditDetails: AuditDetails(
        createdBy: userUuid,
        createdTime: now,
        lastModifiedBy: userUuid,
        lastModifiedTime: now,
      ),
    );

    await context.read<UserActionLocalRepository>().create(action);
    if (!mounted) return;

    context.router.maybePop(
      newSettlementBoundary(
        action: action,
        parent: widget.parent,
        label: widget.label,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final hasLocation =
        _location?.latitude != null && _location?.longitude != null;

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => form,
        builder: (context, form, child) => ScrollableContent(
          header: const BackNavigationHelpHeaderWidget(showHelp: false),
          enableFixedDigitButton: true,
          footer: DigitCard(
            margin: const EdgeInsets.only(top: spacer2),
            children: [
              DigitButton(
                label: localizations.translate(i18.newSettlement.saveAction),
                type: DigitButtonType.primary,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
                isDisabled: _saving || !hasLocation,
                onPressed: _save,
              ),
            ],
          ),
          slivers: [
            SliverToBoxAdapter(
              child: DigitCard(
                margin: const EdgeInsets.all(spacer2),
                children: [
                  Text(
                    localizations.translate(i18.newSettlement.title),
                    style: textTheme.headingXl.copyWith(
                      color: theme.colorTheme.primary.primary2,
                    ),
                  ),
                  LabeledField(
                    label:
                        localizations.translate(i18.newSettlement.parentLabel),
                    capitalizedFirstLetter: false,
                    child: DigitTextFormInput(
                      readOnly: true,
                      initialValue:
                          localizations.translate(widget.parent.code ?? ''),
                    ),
                  ),
                  ReactiveWrapperField(
                    formControlName: _name,
                    validationMessages: {
                      'required': (control) => localizations
                          .translate(i18.newSettlement.nameRequired),
                      'duplicate': (control) => localizations
                          .translate(i18.newSettlement.duplicateName),
                    },
                    builder: (field) => LabeledField(
                      label:
                          localizations.translate(i18.newSettlement.nameLabel),
                      capitalizedFirstLetter: false,
                      isRequired: true,
                      child: DigitTextFormInput(
                        keyboardType: TextInputType.text,
                        initialValue: form.control(_name).value,
                        errorMessage: field.errorText,
                        onChange: (value) {
                          form.control(_name).value = value;
                        },
                      ),
                    ),
                  ),
                  LabeledField(
                    label: localizations
                        .translate(i18.newSettlement.locationLabel),
                    capitalizedFirstLetter: false,
                    isRequired: true,
                    child: _capturing
                        ? Text(
                            localizations.translate(
                                i18.newSettlement.locationCapturing),
                            style: textTheme.bodyS,
                          )
                        : hasLocation
                            ? Text(
                                '${_location!.latitude!.toStringAsFixed(6)}, '
                                '${_location!.longitude!.toStringAsFixed(6)}'
                                '${_location!.accuracy != null ? ' (±${_location!.accuracy!.toStringAsFixed(0)} m)' : ''}',
                                style: textTheme.bodyS,
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    localizations.translate(
                                        i18.newSettlement.locationUnavailable),
                                    style: textTheme.bodyS.copyWith(
                                      color: theme.colorTheme.alert.error,
                                    ),
                                  ),
                                  DigitButton(
                                    label: localizations.translate(
                                        i18.newSettlement.retryLocation),
                                    type: DigitButtonType.link,
                                    size: DigitButtonSize.medium,
                                    onPressed: _captureLocation,
                                  ),
                                ],
                              ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
