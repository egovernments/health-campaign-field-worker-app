import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:complaints/blocs/complaint_wrapper/complaint_wrapper_bloc.dart';
import 'package:complaints/utils/constants.dart';
import 'package:complaints/widgets/localized.dart';
import 'package:digit_data_model/models/entities/pgr_application_status.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/models/DropdownModels.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_ui_components/widgets/atoms/digit_dropdown_input.dart';
import 'package:digit_ui_components/widgets/atoms/digit_radio_list.dart';
import 'package:digit_ui_components/widgets/atoms/digit_text_form_input.dart';
import 'package:digit_ui_components/widgets/atoms/labelled_fields.dart';
import 'package:digit_ui_components/widgets/atoms/reactive_fields.dart';
import 'package:digit_ui_components/widgets/helper_widget/button_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '/utils/i18_key_constants.dart' as i18;
import '../../blocs/localization/app_localization.dart';
import '../../utils/utils.dart';

@RoutePage()
class ComplaintsInboxDialogPage extends LocalizedStatefulWidget {
  final ComplaintsInboxDialogType type;
  final String titleKey;
  final String ctaKey;

  const ComplaintsInboxDialogPage({
    super.key,
    required this.type,
    required this.titleKey,
    required this.ctaKey,
  });

  @override
  State<ComplaintsInboxDialogPage> createState() =>
      _ComplaintsInboxDialogPageState();
}

class _ComplaintsInboxDialogPageState
    extends LocalizedState<ComplaintsInboxDialogPage> {
  late FormGroup _formGroup;

  @override
  void initState() {
    super.initState();
    _formGroup = _buildForm(context);
  }

  FormGroup _buildForm(BuildContext context) {
    final blocState = context.read<ComplaintWrapperBloc>().state;

    switch (widget.type) {
      case ComplaintsInboxDialogType.search:
        return fb.group({
          'complaintNumber':
              FormControl<String>(value: blocState.searchKeys?.complaintNumber),
          'mobileNumber': FormControl<String>(
            value: blocState.searchKeys?.complainantMobileNumber,
          ),
        });
      case ComplaintsInboxDialogType.filter:
        return fb.group({
          'complaintType':
              FormControl<String>(value: blocState.filters?.complaintTypeCode),
          'complaintLocality':
              FormControl<String>(value: blocState.filters?.locality),
          'complaintAssignmentType': FormControl<String>(
              value: blocState.filters?.complaintAssignedTo),
          'complaintStatus': FormControl<List<PgrServiceApplicationStatus>>(
            value: blocState.filters?.complaintStatus,
          ),
        });
      case ComplaintsInboxDialogType.sort:
        return fb.group({
          'sortOrder': FormControl<String>(value: blocState.sortOrder),
        });
    }
  }

  Widget _buildFields(BuildContext context) {
    switch (widget.type) {
      case ComplaintsInboxDialogType.search:
        return _buildSearchFields(context, _formGroup);
      case ComplaintsInboxDialogType.filter:
        return _buildFilterFields(context, _formGroup);
      case ComplaintsInboxDialogType.sort:
        return _buildSortFields(context, _formGroup);
    }
  }

  void _onSubmit(BuildContext context) {
    final form = _formGroup;
    final bloc = context.read<ComplaintWrapperBloc>();

    switch (widget.type) {
      case ComplaintsInboxDialogType.search:
        final complaintNumber =
            form.control('complaintNumber').value as String?;
        final mobileNumber = form.control('mobileNumber').value as String?;
        bloc.add(ComplaintWrapperEvent.search(
          mobileNumber: mobileNumber,
          complaintNumber: complaintNumber,
        ));
        break;

      case ComplaintsInboxDialogType.filter:
        final complaintType = form.control('complaintType').value as String?;
        final complaintLocality =
            form.control('complaintLocality').value as String?;
        final complaintAssignmentType =
            form.control('complaintAssignmentType').value as String?;
        final complaintStatus = form.control('complaintStatus').value
            as List<PgrServiceApplicationStatus>?;
        bloc.add(
          ComplaintWrapperEvent.filter(
            createdByUserId: ComplaintsSingleton().loggedInUserUuid,
            currentUserName: ComplaintsSingleton().userName,
            complaintAssignedTo: complaintAssignmentType,
            complaintTypeCode: complaintType,
            locality: complaintLocality,
            complaintStatus: complaintStatus,
          ),
        );
        break;

      case ComplaintsInboxDialogType.sort:
        final sortOrder = form.control('sortOrder').value as String?;
        if (sortOrder != null && sortOrder.isNotEmpty) {
          bloc.add(ComplaintWrapperEvent.sort(sortOrder));
        }
        break;
    }

    context.router.pop();
  }

  void _onClear(BuildContext context) {
    _formGroup.reset();
    context.read<ComplaintWrapperBloc>().add(
          const ComplaintWrapperEvent.loadFromGlobal(),
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: ReactiveForm(
        formGroup: _formGroup,
        child: ScrollableContent(
          header: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: spacer4, top: spacer2),
                child: Text(
                  localizations.translate(widget.titleKey),
                  style: textTheme.headingXl
                      .copyWith(color: theme.colorTheme.primary.primary2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: spacer2, right: spacer2),
                child: InkWell(
                  onTap: () => context.router.pop(),
                  child: const Icon(Icons.close, size: spacer6),
                ),
              ),
            ],
          ),
          footer: DigitCard(
            inline: true,
            cardType: CardType.primary,
            margin: const EdgeInsets.fromLTRB(0, spacer2, 0, 0),
            children: [
              DigitButtonListTile(
                isVertical: false,
                spacing: spacer4,
                buttons: [
                  DigitButton(
                    mainAxisSize: MainAxisSize.min,
                    type: DigitButtonType.secondary,
                    size: DigitButtonSize.large,
                    label: localizations
                        .translate(i18.complaints.complaintsFilterClearAll),
                    onPressed: () => _onClear(context),
                  ),
                  DigitButton(
                    mainAxisSize: MainAxisSize.min,
                    type: DigitButtonType.primary,
                    size: DigitButtonSize.large,
                    label: localizations.translate(widget.ctaKey),
                    onPressed: () => _onSubmit(context),
                  ),
                ],
              )
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(spacer2 * 2),
              child: _buildFields(context),
            ),
          ],
        ),
      ),
    );
  }

  /// ===== Search Fields =====
  Widget _buildSearchFields(BuildContext context, FormGroup form) {
    const _complaintNumber = "complaintNumber";
    const _mobileNumber = "mobileNumber";

    return Column(
      children: [
        ReactiveWrapperField<String>(
          formControlName: _complaintNumber,
          builder: (field) {
            return LabeledField(
              label: localizations.translate(
                i18.complaints.inboxNumberLabel,
              ),
              child: DigitTextFormInput(
                initialValue: form.control(_complaintNumber).value,
                onChange: (value) =>
                    form.control(_complaintNumber).value = value,
                charCount: true,
                maxLength: 65,
              ),
            );
          },
        ),
        ReactiveWrapperField<String>(
          formControlName: _mobileNumber,
          showErrors: (control) => control.invalid && control.touched,
          validationMessages: {
            'mobileNumber': (object) => localizations.translate(
                  i18.individualDetails
                      .mobileNumberInvalidFormatValidationMessage,
                ),
          },
          builder: (field) {
            return LabeledField(
              label: localizations.translate(
                i18.common.coreCommonMobileNumber,
              ),
              child: DigitTextFormInput(
                charCount: true,
                initialValue: form.control(_mobileNumber).value,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChange: (value) => form.control(_mobileNumber).value = value,
                errorMessage: field.errorText,
                maxLength: 10,
              ),
            );
          },
        ),
      ],
    );
  }

  /// ===== Filter Fields =====
  Widget _buildFilterFields(BuildContext context, FormGroup form) {
    final localizations = Localizations.of<ComplaintsLocalization>(
        context, ComplaintsLocalization)!;

    final blocState = context.read<ComplaintWrapperBloc>().state;
    Set<String> complaintTypes = HashSet();
    Set<String> locality = HashSet();
    Set<PgrServiceApplicationStatus> uniqueStatuses = HashSet();
    Map<int, int> statusCount = HashMap();

    final currentValue = form.control('complaintStatus').value
        as List<PgrServiceApplicationStatus>?;

    Set<PgrServiceApplicationStatus> statuses = (currentValue ?? []).toSet();

    for (var e in blocState.complaints) {
      complaintTypes.add(e.complaint!.serviceCode.toString());
      if (e.address?.locality?.code != null) {
        locality.add(e.address?.locality?.code ?? "");
      }
      var status = e.complaint!.applicationStatus;
      uniqueStatuses.add(status);
      statusCount[status.index] = (statusCount[status.index] ?? 0) + 1;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioList(
          containerPadding: const EdgeInsets.only(bottom: spacer4),
          radioDigitButtons:
              [i18.complaints.assignedToAll, i18.complaints.assignedToSelf]
                  .map((code) => RadioButtonModel(
                        code: code,
                        name: localizations.translate(code),
                      ))
                  .toList(),
          groupValue: form.control('complaintAssignmentType').value ?? "",
          onChanged: (val) =>
              form.control('complaintAssignmentType').value = val.code,
        ),
        LabeledField(
          label: localizations.translate(i18.complaints.complaintsTypeHeading),
          child: DigitDropdown<String>(
            items: complaintTypes
                .map((type) => DropdownItem(
                      code: type,
                      name: localizations
                          .translate(type.trim().snakeCase.toUpperCase()),
                    ))
                .toList(),
            selectedOption: _selectedDropdown(
                form.control('complaintType').value as String?, complaintTypes),
            onSelect: (val) => form.control('complaintType').value = val.code,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: spacer4),
          child: LabeledField(
            label: localizations.translate(i18.complaints.locality),
            child: DigitDropdown<String>(
              items: locality
                  .map((loc) => DropdownItem(
                        code: loc,
                        name: localizations.translate(loc.trim()),
                      ))
                  .toList(),
              selectedOption: _selectedDropdown(
                  form.control('complaintLocality').value as String?, locality),
              onSelect: (val) =>
                  form.control('complaintLocality').value = val.code,
            ),
          ),
        ),
        if (uniqueStatuses.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(top: spacer4),
            child: LabeledField(
              label: localizations.translate(i18.complaints.inboxStatusLabel),
              child: Column(
                children: uniqueStatuses.map((status) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: spacer4),
                    child: DigitCheckbox(
                      label:
                          '${localizations.translate('COMPLAINTS_STATUS_${status.name.snakeCase.toUpperCase()}')} (${statusCount[status.index]})',
                      value: statuses.contains(status),
                      onChanged: (val) {
                        setState(() {
                          if (statuses.contains(status)) {
                            statuses.remove(status);
                          } else {
                            statuses.add(status);
                          }
                          form
                              .control('complaintStatus')
                              .updateValue(statuses.toList());
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ],
    );
  }

  DropdownItem? _selectedDropdown(String? value, Set<String> options) {
    if (value == null) return null;
    return DropdownItem(
      code: value,
      name: localizations.translate(value.trim().snakeCase.toUpperCase()),
    );
  }

  /// ===== Sort Fields =====
  Widget _buildSortFields(BuildContext context, FormGroup form) {
    final sortOrders = [
      i18.complaints.complaintsSortDateDesc,
      i18.complaints.complaintsSortDateAsc,
    ];

    return RadioList(
      containerPadding: const EdgeInsets.only(bottom: spacer4),
      radioDigitButtons: sortOrders
          .map((code) => RadioButtonModel(
                code: code,
                name: localizations.translate(code),
              ))
          .toList(),
      groupValue: form.control('sortOrder').value ?? "",
      onChanged: (val) => form.control('sortOrder').value = val.code,
    );
  }
}
