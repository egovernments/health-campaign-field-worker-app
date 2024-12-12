import 'dart:convert';

import 'package:complaints/blocs/localization/app_localization.dart';
import 'package:complaints/complaints.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class Language {
  late String label;
  late String value;

  Language(this.label, this.value);
}

class Localization {
  late String code;

  late String message;

  late String module;

  late String locale;
}

Future<dynamic> loadLocalizedStrings() async {
  final String jsonString =
      await rootBundle.loadString('lib/localization_strings.json');
  final decode = json.decode(jsonString);

  List<dynamic> localizationList;
  localizationList = decode.map((e) {
    final data = e;
    return Localization()
      ..code = data['code']
      ..locale = data['locale']
      ..module = data['module']
      ..message = data['message'];
  }).toList();

  return Future.value(localizationList);
}

class MyApp extends StatelessWidget {
  late Future<dynamic> localizedStrings = loadLocalizedStrings();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: "Complaints Package Demo"),
      locale: Locale('en', 'MZ'),
      supportedLocales: [const Locale('en', 'MZ')],
      localizationsDelegates: [
        ComplaintsLocalization.getDelegate(
            loadLocalizedStrings(), [Language("English", "en_MZ")]),
        // Add other localizations delegates if needed
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("PGR-Complaints Example"),
        ),
        body: Center(
          child: DigitButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ComplaintsAcknowledgementPage(),
                ),
              );
            },
            label: "Demo Acknowledgemnet",
            type: DigitButtonType.secondary,
            size: DigitButtonSize.large,
          ),
        ));
  }
}
