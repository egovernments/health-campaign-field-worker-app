import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_base_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_date_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_location_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_numeric_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_password_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_search_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_text_area_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_time_form_input.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:isar/isar.dart';
import 'app.dart';
import 'blocs/app_bloc_observer.dart';
import 'data/local_store/app_shared_preferences.dart';
import 'data/local_store/secure_store/secure_store.dart';
import 'data/local_store/sql_store/sql_store.dart';
import 'data/remote_client.dart';
import 'firebase_options.dart';
import 'router/app_router.dart';
import 'utils/background_service.dart';
import 'utils/environment_config.dart';
import 'utils/utils.dart';

final LocalSqlDataStore _sql = LocalSqlDataStore();
late Dio _dio;
late Isar _isar;
int i = 0;

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: ScrollableContent(
        children: [
          DigitCard(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DigitTextFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    info: 'this is info',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                    // onSuffixTap: (){print('tapppppppppp');},
                    // suffixIcon: Icons.currency_rupee_sharp,
                    // prefixIcon: Icons.currency_rupee,
                  ),
                  const SizedBox(height: 8,),
                  DigitTextAreaFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    info: 'this is info',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                    // onSuffixTap: (){print('tapppppppppp');},
                    // suffixIcon: Icons.currency_rupee_sharp,
                    // prefixIcon: Icons.currency_rupee,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DigitDateFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    info: 'this is info',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                    // onSuffixTap: (){print('tapppppppppp');},
                    // suffixIcon: Icons.currency_rupee_sharp,
                    // prefixIcon: Icons.currency_rupee,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DigitTimeFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    info: 'this is info',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                    // onSuffixTap: (){print('tapppppppppp');},
                    // suffixIcon: Icons.currency_rupee_sharp,
                    // prefixIcon: Icons.currency_rupee,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DigitSearchFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    info: 'this is info',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                    // onSuffixTap: (){print('tapppppppppp');},
                    // suffixIcon: Icons.currency_rupee_sharp,
                    // prefixIcon: Icons.currency_rupee,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DigitPasswordFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    info: 'this is info',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                    // onSuffixTap: (){print('tapppppppppp');},
                    // suffixIcon: Icons.currency_rupee_sharp,
                    // prefixIcon: Icons.currency_rupee,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DigitTextFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    info: 'this is info',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                    // onSuffixTap: (){print('tapppppppppp');},
                    suffixIcon: Icons.currency_rupee_sharp,
                    prefixIcon: Icons.currency_rupee,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DigitNumericFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    info: 'this is info',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                    initialValue: '0',
                  ),
                  const SizedBox(height: 8,),
                  DigitLocationFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    info: 'this is info',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    final localSecureStore = LocalSecureStore.instance;
    if (state == AppLifecycleState.paused) {
      setBgRunning(true);
      // Stop the background service when the app is terminated
    } else if (state == AppLifecycleState.resumed) {
      // Stop the background service when the app is terminated
      setBgRunning(false);
      final isRunning = await FlutterBackgroundService().isRunning();
      final localSecureStore = LocalSecureStore.instance,
          isBgRunning = await localSecureStore.isBackgroundSerivceRunning;
      if (!isRunning && isBgRunning) {}
    }
  }
}
