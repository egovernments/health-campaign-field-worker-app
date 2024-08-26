import 'dart:convert';

import 'package:checklist/blocs/app_localization.dart';
import 'package:checklist/blocs/checklist_localization_delegate.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:checklist/pages/acknowledgement.dart';
import 'package:flutter/services.dart';

import 'localizedString.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Checklist Package Example'),
    );
  }
}

Future<List> loadLocalizedStrings() async{
  String jsonString = await rootBundle.loadString('lib/data.json');
    // Decode the JSON string
    List<dynamic> jsonList = jsonDecode(jsonString);

    // Convert the dynamic list to a list of LocalizedString objects
    return jsonList.map((jsonItem) => LocalizedString.fromJson(jsonItem)).toList();
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<dynamic> localizedStrings;
  final languages=[
    {
      "label":"PORTUGUÊS",
      "value":"pt_MZ"
    },
    {
      "label":"FRENCH",
      "value":"fr_MZ"
    },
    {
      "label":"ENGLISH",
      "value":"en_MZ"
    }
  ];

  @override
  void initState() {
    super.initState();
    localizedStrings = loadLocalizedStrings();

    ChecklistLocalizationDelegate delegate = ChecklistLocalizationDelegate(localizedStrings, languages);
    delegate.load(const Locale("en","MZ"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child:Container(
          width: 300,
          child: DigitElevatedButton(
            child: const Text("Acknowledgement Page"),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => ChecklistAcknowledgementPage(
                        appLocalizations: ChecklistLocalization(
                            const Locale("en","MZ"),
                            localizedStrings,
                            languages
                        ),
                      ))
              );
            },
          ),
        ),
      ),
    );
  }
}
