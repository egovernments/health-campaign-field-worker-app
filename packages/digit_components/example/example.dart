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
  String relationshipKey = 'relationship';
  String mobileNumberKey = 'mobileNumber';
  String genderKey = 'gender';
  String dobKey = 'dateOfBirth';

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
      body: ScrollableContent(
        header: const Text(
          'User Details',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
        children: [
          ReactiveFormBuilder(
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
                        validationMessages: {
                          'required': (_) => 'Name is required',
                          'minLength': (_) =>
                              'Name should be minimum of 2 characters',
                          'maxLength': (_) =>
                              'Name should be maximum of 128 characters',
                        },
                      ),
                      DigitTextFormField(
                        formControlName: fatherNameKey,
                        isRequired: true,
                        label: 'Guardian Name',
                        validationMessages: {
                          'required': (_) => 'Guardian name is required',
                          'minLength': (_) =>
                              'Guardian name should be minimum of 2 characters',
                          'maxLength': (_) =>
                              'Guardian name should be maximum of 128 characters',
                        },
                      ),
                      DigitReactiveDropdown<String>(
                        label: 'Relationship',
                        menuItems: const ['father', 'husband'],
                        isRequired: true,
                        formControlName: relationshipKey,
                        valueMapper: (value) => value.toUpperCase(),
                        onChanged: (value) {},
                        validationMessages: {
                          'required': (_) =>
                              'Please mention the relationship with the guardian',
                        },
                      ),
                      DigitTextFormField(
                        label: 'Mobile Number',
                        formControlName: mobileNumberKey,
                        isRequired: true,
                        minLength: 10,
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        validationMessages: {
                          'required': (_) => 'Mobile number is required',
                          'minLength': (_) =>
                              'Mobile number should be of 10 digits',
                          'maxLength': (_) =>
                              'Mobile number should be of 10 digits',
                          'min': (_) => 'Mobile number should start from 6-9',
                          'max': (_) => 'Mobile number should start from 6-9',
                        },
                      ),
                      DigitDateFormPicker(
                        label: 'Date of birth',
                        isRequired: true,
                        icon: Icons.info_outline_rounded,
                        formControlName: dobKey,
                        autoValidation: AutovalidateMode.always,
                        requiredMessage: 'Date of birth is required',
                      ),
                      DigitReactiveDropdown<String>(
                        label: 'Gender',
                        menuItems: const ['male', 'female', 'transgender'],
                        formControlName: genderKey,
                        valueMapper: (value) => value.toUpperCase(),
                        onChanged: (value) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DigitElevatedButton(
                            onPressed: () {
                              if (form.valid) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Yay ! Details Submitted')));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Oops ! Please fill the mandatory details')));
                              }
                            },
                            child: const Text('Submit')),
                      )
                    ],
                  ),
                );
              })
        ],
      ), // This trailing comma makes auto-formattig nicer for build methods.
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        nameKey: FormControl<String>(value: '', validators: [
          Validators.required,
          Validators.minLength(2),
          Validators.maxLength(128)
        ]),
        fatherNameKey: FormControl<String>(value: '', validators: [
          Validators.required,
          Validators.minLength(2),
          Validators.maxLength(128)
        ]),
        relationshipKey:
            FormControl<String>(value: null, validators: [Validators.required]),
        dobKey: FormControl<DateTime>(
            value: null, validators: [Validators.required]),
        genderKey: FormControl<String>(value: null),
        mobileNumberKey: FormControl<String>(value: '', validators: [
          Validators.required,
          Validators.minLength(10),
          Validators.maxLength(10),
          Validators.min('5999999999'),
          Validators.max('9999999999'),
        ])
      });
}
