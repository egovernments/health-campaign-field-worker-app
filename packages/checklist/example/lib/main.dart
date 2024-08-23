import 'dart:convert';

import 'package:checklist/blocs/app_localization.dart';
import 'package:checklist/blocs/checklist_localization_delegate.dart';
import 'package:flutter/material.dart';
import 'package:checklist/pages/acknowledgement.dart';
import 'package:checklist/blocs/app_localization.dart' as checklist_localization;
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    delegate.load(Locale("en","MZ"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ChecklistAcknowledgementPage(
                appLocalizations: ChecklistLocalization(
                    Locale("en","MZ"),
                    localizedStrings,
                    languages
                ),
              ))
          );
        },
        tooltip: 'Open Checklist',
        child: const Icon(Icons.open_in_browser_rounded),
      ),
    );
  }
}
