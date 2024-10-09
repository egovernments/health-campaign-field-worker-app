import 'package:collection/collection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_data_model/blocs/user/user.dart';
import 'package:digit_data_model/data_model.dart';
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
              Loaders.showLoadingDialog(context);
            },
            user: (value) {
              if (isLoading) {
                Navigator.of(context, rootNavigator: true).pop();
              }
              if (isUpdate) {
                DigitToast.show(context,
                    options: DigitToastOptions(
                        localizations
                            .translate(i18.common.profileUpdateSuccess),
                        false,
                        theme));
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
              DigitToast.show(
                context,
                options: DigitToastOptions(
                  error ?? localizations.translate(error!),
                  true,
                  theme,
                ),
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
                    enableFixedButton: true,
                    footer: DigitCard(
                      margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                      padding:
                          const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                      child: BlocBuilder<UserBloc, UserState>(
                        builder: (ctx, state) {
                          return DigitElevatedButton(
                            onPressed: () async {
                              final connectivityResult =
                                  await (Connectivity().checkConnectivity());
                              final isOnline = connectivityResult.firstOrNull ==
                                      ConnectivityResult.wifi ||
                                  connectivityResult.firstOrNull ==
                                      ConnectivityResult.mobile;

                              if (!isOnline) {
                                if (context.mounted) {
                                  DigitDialog.show(
                                    context,
                                    options: DigitDialogOptions(
                                      titleText: AppLocalizations.of(context)
                                          .translate(
                                        i18.common.connectionLabel,
                                      ),
                                      contentText: AppLocalizations.of(context)
                                          .translate(
                                        i18.common.connectionContent,
                                      ),
                                      primaryAction: DigitDialogActions(
                                        label: AppLocalizations.of(context)
                                            .translate(
                                          i18.common.coreCommonOk,
                                        ),
                                        action: (ctx) => Navigator.of(
                                          context,
                                          rootNavigator: true,
                                        ).pop(),
                                      ),
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
                                    gender: formGroup.control(_genderKey).value
                                        as String,
                                    mobileNumber: formGroup
                                        .control(_mobileNumberKey)
                                        .value,
                                    name: formGroup.control(_name).value
                                        as String,
                                    emailId: formGroup.control(_emailId).value
                                        as String?,
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
                            child: Center(
                              child: Text(
                                localizations
                                    .translate(i18.common.coreCommonSave),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    header: const Column(children: [
                      BackNavigationHelpHeaderWidget(),
                    ]),
                    children: [
                      DigitCard(
                        child: Column(
                          children: [
                            DigitTextFormField(
                              formControlName: 'name',
                              label: localizations.translate(
                                i18.common.coreCommonName,
                              ),
                              maxLength: 200,
                              isRequired: true,
                              validationMessages: {
                                'required': (object) => localizations.translate(
                                      '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                                    ),
                              },
                            ),
                            DigitTextFormField(
                              keyboardType: TextInputType.number,
                              formControlName: _mobileNumberKey,
                              label: localizations.translate(
                                i18.common.coreCommonMobileNumber,
                              ),
                              maxLength: 10,
                              readOnly: true,
                              validationMessages: {
                                'mobileNumber': (object) =>
                                    localizations.translate(i18
                                        .individualDetails
                                        .mobileNumberInvalidFormatValidationMessage),
                              },
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
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            localizations.translate(
                                              i18.common.coreCommonGender,
                                            ),
                                            style: theme.textTheme.titleMedium,
                                          ),
                                        ],
                                      ),
                                      ...appConfiguration.genderOptions!
                                          .map((e) =>
                                              ReactiveRadioListTile<String>(
                                                value: e.code,
                                                title: Text(localizations
                                                    .translate(e.code)),
                                                formControlName: _genderKey,
                                              ))
                                          ,
                                    ],
                                  );
                                },
                              ),
                            ),
                            DigitTextFormField(
                              formControlName: _emailId,
                              label: localizations.translate(
                                i18.common.coreCommonEmailId,
                              ),
                              maxLength: 200,
                              validationMessages: {
                                'required': (object) => localizations.translate(
                                      '${i18.individualDetails.nameLabelText}_IS_REQUIRED',
                                    ),
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
