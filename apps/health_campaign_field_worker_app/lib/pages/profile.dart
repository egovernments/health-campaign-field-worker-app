import 'package:collection/collection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/localization/app_localization.dart';
import '../router/app_router.dart';
import '../utils/utils.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

@RoutePage()
class ProfilePage extends LocalizedStatefulWidget {
  const ProfilePage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends LocalizedState<ProfilePage> {
  static const _genderKey = 'gender';
  static const _mobileNumberKey = 'mobileNumber';
  static const _name = 'name';
  static const _emailId = 'emailId';

  bool isLoading = false;
  bool isUpdate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<UserBloc>().add(UserSearchUserEvent(
            uuid: context.loggedInUserUuid,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    final theme = Theme.of(context);
    FormGroup buildForm(UserState state) {
      final user = state.mapOrNull(
        user: (value) => value.userModel,
      );

      return fb.group(<String, Object>{
        _name: FormControl<String>(value: user?.name, validators: []),
        _mobileNumberKey: FormControl<String>(
          value: user?.mobileNumber,
          validators: [
            Validators.pattern(Constants.mobileNumberRegExp,
                validationMessage:
                    localizations.translate(i18.common.coreCommonMobileNumber))
          ],
        ),
        _emailId: FormControl<String>(
          value: user?.emailId,
          validators: [Validators.email],
        ),
        _genderKey: FormControl<String>(
          value: context.read<AppInitializationBloc>().state.maybeWhen(
                orElse: () => null,
                initialized: (
                  appConfiguration,
                  serviceRegistryList,
                  _,
                ) {
                  return appConfiguration.genderOptions
                      ?.map((e) => e.code)
                      .firstWhereOrNull((element) => element == user?.gender);
                },
              ),
        ),
      });
    }

    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loading: () {
              setState(() {
                isLoading = true;
              });
              DigitLoaders.overlayLoader(context: context);
            },
            user: (value) {
              if (isLoading) {
                Navigator.of(context, rootNavigator: true).pop();
              }
              if (isUpdate) {
                Toast.showToast(
                  context,
                  message:
                      localizations.translate(i18.common.profileUpdateSuccess),
                  type: ToastType.success,
                );
              }
              setState(() {
                isLoading = false;
                isUpdate = false;
              });
            },
            error: (error) {
              Navigator.of(context, rootNavigator: true).pop();
              setState(() {
                isLoading = false;
                isUpdate = false;
              });
              Toast.showToast(
                context,
                message: error ?? localizations.translate(error!),
                type: ToastType.error,
              );
            },
          );
          // do stuff here based on BlocA's state
        },
        child: isLoading
            ? const SizedBox()
            : ReactiveFormBuilder(
                form: () => buildForm(bloc.state),
                builder:
                    (BuildContext context, FormGroup formGroup, Widget? child) {
                  return ScrollableContent(
                    enableFixedDigitButton: true,
                    footer: DigitCard(
                        margin: const EdgeInsets.only(top: spacer2),
                        children: [
                          BlocBuilder<UserBloc, UserState>(
                            builder: (ctx, state) {
                              return DigitButton(
                                label: localizations
                                    .translate(i18.common.coreCommonSave),
                                type: DigitButtonType.primary,
                                size: DigitButtonSize.large,
                                mainAxisSize: MainAxisSize.max,
                                onPressed: () async {
                                  final connectivityResult =
                                      await (Connectivity()
                                          .checkConnectivity());
                                  final isOnline =
                                      connectivityResult.firstOrNull ==
                                              ConnectivityResult.wifi ||
                                          connectivityResult.firstOrNull ==
                                              ConnectivityResult.mobile;

                                  if (!isOnline) {
                                    if (context.mounted) {
                                      showCustomPopup(
                                        context: context,
                                        builder: (ctx) => Popup(
                                          title: AppLocalizations.of(context)
                                              .translate(
                                            i18.common.connectionLabel,
                                          ),
                                          description:
                                              AppLocalizations.of(context)
                                                  .translate(
                                            i18.common.connectionContent,
                                          ),
                                          actions: [
                                            DigitButton(
                                                label:
                                                    AppLocalizations.of(context)
                                                        .translate(
                                                  i18.common.coreCommonOk,
                                                ),
                                                onPressed: () => Navigator.of(
                                                      context,
                                                      rootNavigator: true,
                                                    ).pop(),
                                                type: DigitButtonType.primary,
                                                size: DigitButtonSize.large)
                                          ],
                                        ),
                                      );
                                    }
                                  } else {
                                    formGroup.markAllAsTouched();
                                    if (!formGroup.valid) return;
                                    UserModel? user = state.mapOrNull(
                                      user: (value) => value.userModel,
                                    );
                                    if (user != null) {
                                      setState(() {
                                        isUpdate = true;
                                      });
                                      final updatedUser = user.copyWith(
                                        gender: formGroup
                                            .control(_genderKey)
                                            .value as String,
                                        mobileNumber: formGroup
                                            .control(_mobileNumberKey)
                                            .value,
                                        name: formGroup.control(_name).value
                                            as String,
                                        emailId: formGroup
                                            .control(_emailId)
                                            .value as String?,
                                      );

                                      ctx.read<UserBloc>().add(
                                            UserEvent.updateUser(
                                              user: updatedUser,
                                              oldUser: user,
                                            ),
                                          );
                                    }
                                  }
                                },
                              );
                            },
                          ),
                        ]),
                    header: const Column(children: [
                      BackNavigationHelpHeaderWidget(),
                    ]),
                    children: [
                      DigitCard(
                          margin: const EdgeInsets.all(spacer2),
                          children: [
                            ReactiveWrapperField(
                              formControlName: _name,
                              validationMessages: {
                                'required': (object) => localizations.translate(
                                      '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                                    ),
                              },
                              builder: (field) => LabeledField(
                                label: localizations.translate(
                                  i18.common.coreCommonName,
                                ),
                                isRequired: true,
                                child: DigitTextFormInput(
                                  charCount: true,
                                  maxLength: 200,
                                  errorMessage: field.errorText,
                                  onChange: (value) {
                                    formGroup.control(_name).value = value;
                                  },
                                  initialValue: formGroup.control(_name).value,
                                ),
                              ),
                            ),
                            ReactiveWrapperField(
                              formControlName: _mobileNumberKey,
                              validationMessages: {
                                'mobileNumber': (object) =>
                                    localizations.translate(i18
                                        .individualDetails
                                        .mobileNumberInvalidFormatValidationMessage),
                              },
                              builder: (field) => LabeledField(
                                label: localizations.translate(
                                  i18.common.coreCommonMobileNumber,
                                ),
                                capitalizedFirstLetter: false,
                                child: DigitTextFormInput(
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  readOnly: true,
                                  charCount: true,
                                  errorMessage: field.errorText,
                                  onChange: (value) {
                                    formGroup.control(_mobileNumberKey).value =
                                        value;
                                  },
                                  initialValue:
                                      formGroup.control(_mobileNumberKey).value,
                                ),
                              ),
                            ),
                            BlocBuilder<AppInitializationBloc,
                                AppInitializationState>(
                              builder: (context, state) => state.maybeWhen(
                                orElse: () => const Offstage(),
                                initialized: (
                                  appConfiguration,
                                  _,
                                  __,
                                ) {
                                  return ReactiveWrapperField(
                                    formControlName: _genderKey,
                                    builder: (field) => LabeledField(
                                        label: localizations.translate(
                                          i18.common.coreCommonGender,
                                        ),
                                        child: RadioList(
                                          radioDigitButtons: appConfiguration
                                              .genderOptions!
                                              .map((e) => RadioButtonModel(
                                                  code: e.code,
                                                  name: localizations
                                                      .translate(e.code)))
                                              .toList(),
                                          onChanged: (value) {
                                            formGroup
                                                .control(_genderKey)
                                                .value = value.code;
                                          },
                                        )),
                                  );
                                },
                              ),
                            ),
                            ReactiveWrapperField(
                              formControlName: _emailId,
                              validationMessages: {
                                'required': (object) => localizations.translate(
                                      '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                                    ),
                              },
                              builder: (field) => LabeledField(
                                label: localizations.translate(
                                  i18.common.coreCommonEmailId,
                                ),
                                capitalizedFirstLetter: false,
                                child: DigitTextFormInput(
                                  maxLength: 200,
                                  charCount: true,
                                  onChange: (value) {
                                    formGroup.control(_emailId).value = value;
                                  },
                                  initialValue:
                                      formGroup.control(_emailId).value,
                                  errorMessage: field.errorText,
                                ),
                              ),
                            ),
                          ]),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
