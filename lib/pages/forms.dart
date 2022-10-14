import 'package:digit_ui_components/digit_ui_components.dart';
import 'package:digit_ui_components/widgets/digit_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:health_campaigns_flutter/router/app_router.dart';
import 'package:health_campaigns_flutter/widgets/header/back_navigation_help_header.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:forms_engine/json_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_campaigns_flutter/blocs/forms/forms.dart';

class FormsPage extends StatelessWidget {
  final int index;

  const FormsPage({super.key, @PathParam() required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FormsBloc, FormsState>(
        builder: (context, state) {
          if (state.schema == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final schema = state.schema!.pages.entries.elementAt(index).value;

          return ReactiveFormBuilder(
            form: () => fb.group(
              JsonForms.getFormControls(schema),
            ),
            builder: (context, formGroup, child) {
              return ScrollableContent(
                header: const BackNavigationHelpHeaderWidget(),
                footer: DigitCard(
                  margin: EdgeInsets.zero,
                  child: DigitElevatedButton(
                    child: Text(
                      (index) < state.schema!.pages.length - 1
                          ? 'Next'
                          : 'Submit',
                    ),
                    onPressed: () {
                      if ((index) < state.schema!.pages.length - 1) {
                        context.router.push(FormsPageRoute(index: index + 1));
                      }
                    },
                  ),
                ),
                children: [
                  DigitCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (schema.label != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              schema.label!,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        JsonForms(propertySchema: schema),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
