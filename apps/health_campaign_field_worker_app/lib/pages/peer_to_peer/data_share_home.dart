import 'package:attendance_management/widgets/localized.dart';
import 'package:auto_route/annotations.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../utils/i18_key_constants.dart' as i18;
import 'devices_list.dart';

@RoutePage()
class DataShareHomePage extends LocalizedStatefulWidget {
  const DataShareHomePage({super.key});

  @override
  State<DataShareHomePage> createState() => _DataShareHomeState();
}

class _DataShareHomeState extends LocalizedState<DataShareHomePage> {
  @override
  Widget build(BuildContext context) {
    return ScrollableContent(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          child: DigitCard(
            child: Center(
                child: DigitElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DevicesListPage(
                                  deviceType: DeviceType.sender)));
                    },
                    child: Text(
                        localizations.translate(i18.dataShare.sendAction)))),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          child: DigitCard(
            margin: const EdgeInsets.all(kPadding),
            child: Center(
                child: DigitElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DevicesListPage(
                                  deviceType: DeviceType.receiver)));
                    },
                    child: Text(
                        localizations.translate(i18.dataShare.receiveAction)))),
          ),
        )
      ],
    );
  }
}
