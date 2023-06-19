import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Text Field Example',
      theme: DigitTheme.instance.mobileTheme,
      home: const MyHomePage(title: 'Digit Components Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({required this.title, super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String nameKey = 'name';
  String fatherNameKey = 'fatherName';
  String mobileNumberKey = 'mobileNumber';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: ReactiveFormBuilder(
            form: buildForm,
            builder: (context, form, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DigitTextFormField(
                      label: 'Name',
                      formControlName: nameKey,
                      isRequired: true,
                    ),
                    const DigitDateFormPicker(
                        label: 'Date of birth',
                        isRequired: true,
                        icon: Icons.info_outline_rounded,
                        formControlName: 'dateOfBirth',
                        autoValidation: AutovalidateMode.always,
                        requiredMessage: 'Date of birth is required'),
                    DigitReactiveDropdown<String>(
                      label: 'Gender',
                      menuItems: const ['Male', 'Female', 'Transgender'],
                      formControlName: 'socialCategory',
                      valueMapper: (value) => value,
                      onChanged: (value) {},
                    ),
                    DigitElevatedButton(
                        onPressed: () {
                          if (form.valid) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Yay ! Details Submitted')));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Oops ! Please fill the mandatory details')));
                          }
                        },
                        child: const Text('Submit'))
                  ],
                ),
              );
            }),
      ), // This trailing comma makes auto-formattig nicer for build methods.
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        nameKey: FormControl<String>(value: '', validators: [
          Validators.required,
          Validators.minLength(2),
          Validators.maxLength(128)
        ]),
        fatherNameKey:
            FormControl<String>(value: null, validators: [Validators.required]),
        mobileNumberKey: FormControl<String>(value: '', validators: [
          Validators.required,
          Validators.minLength(10),
          Validators.maxLength(10)
        ])
      });
}
