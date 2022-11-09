// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/blocs/walkthrough/walkthrough.dart';
import 'package:forms_engine/forms_engine.dart';
import 'package:forms_engine/widgets/pointer.dart';
import 'package:forms_engine/widgets/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormWalkthrough extends StatelessWidget {
  final PropertySchema schema;
  const FormWalkthrough({super.key, required this.schema});

  static Future<T?> show<T>(BuildContext context, PropertySchema schema) =>
      showGeneralDialog(
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 700),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          context.read<WalkthroughBloc>().add(
                const RequestWalkthroughResetEvent(),
              );
          return FormWalkthrough(
            schema: schema,
          );
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(anim1),
            child: child,
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalkthroughBloc, WalkthroughState>(
      builder: (context, state) {
        RenderBox? box = ((GlobalObjectKey(
          schema.properties!.entries
              .elementAt(state.walkthroughIndex)
              .value
              .indexKey
              .toString(),
        )).currentContext?.findRenderObject() as RenderBox?);
        Offset? position = box!.localToGlobal(Offset.zero);
        String? infoText = schema.properties?.entries
            .elementAt(state.walkthroughIndex)
            .value
            .infoText;

        return Stack(
          children: [
            Positioned(
              left: 20,
              top: position.dy,
              child: Material(
                child: SizedBox(
                  height: box.size.height + 20,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ReactiveFormBuilder(
                      form: () => fb.group(
                        JsonForms.getFormControls(schema),
                      ),
                      builder: (context, formGroup, child) =>
                          ReactiveFormConsumer(
                        builder: (context, formGroup, child) => JsonFormBuilder(
                          schema: schema.properties!.entries
                              .elementAt(state.walkthroughIndex)
                              .value,
                          formControlName: schema.properties!.entries
                              .elementAt(state.walkthroughIndex)
                              .key,
                          indexKey: '',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: position.dx + 40,
              top: position.dy + box.size.height + 20,
              child: CustomPaint(
                painter: TrianglePainter(
                  strokeColor: Colors.white,
                  strokeWidth: 5,
                  paintingStyle: PaintingStyle.fill,
                ),
                child: const SizedBox(
                  height: 30,
                  width: 50,
                ),
              ),
            ),
            Positioned(
              top: box.size.height + position.dy + 20,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: infoText != null
                              ? Text(
                                  infoText,
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  style: const TextStyle(height: 1.5),
                                )
                              : null,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                height: 30, //height of button
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Skip',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                )),
                            SizedBox(
                              height: 30, //height of button
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 3, //elevation of button
                                  shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(10)),
                                  //content padding inside button
                                ),
                                onPressed: () async {
                                  await Scrollable.ensureVisible(
                                      GlobalObjectKey(schema.properties!.entries
                                              .elementAt(state.walkthroughIndex)
                                              .value
                                              .indexKey!)
                                          .currentContext!,
                                      duration:
                                          const Duration(milliseconds: 100));

                                  state.walkthroughIndex !=
                                          schema.properties!.entries.length - 1
                                      ? context.read<WalkthroughBloc>().add(
                                          RequestWalkthroughNextEvent(
                                              walkthroughIndex:
                                                  state.walkthroughIndex))
                                      : Navigator.of(context).pop();
                                },
                                child: Text(
                                  state.walkthroughIndex !=
                                          schema.properties!.entries.length - 1
                                      ? 'Next'
                                      : 'End',
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
