import 'package:digit_components/widgets/digit_pointer.dart';
import 'package:flutter/material.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DigitCardWalkthrough extends StatelessWidget {
  const DigitCardWalkthrough({super.key});

  static Future<T?> show<T>(BuildContext context) => showGeneralDialog(
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 700),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          context
              .read<WalkthroughBloc>()
              .add(const RequestWalkthroughResetEvent());
          return const DigitCardWalkthrough();
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
      var walkthroughdata =
          state.walkthroughData.walkthrough[state.walkthroughIndex];
      RenderBox? box = ((GlobalObjectKey(walkthroughdata.widgetKey))
          .currentContext
          ?.findRenderObject() as RenderBox?);
      Offset position = box!.localToGlobal(Offset.zero);
      return Stack(children: [
        Positioned(
          left: position.dx,
          top: position.dy,
          child: SizedBox(
              height: box.size.height,
              width: box.size.width,
              child: DigitIconCard(
                icon:
                    IconData(walkthroughdata.icon, fontFamily: 'MaterialIcons'),
                label: walkthroughdata.title,
                onPressed: () {
                  AppLogger.instance.info("Icon Clicked");
                },
              )),
        ),
        Positioned(
            left: position.dx + 40,
            top: position.dy + box.size.height,
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
            )),
        Positioned(
            left: ((state.walkthroughIndex + 1) % 3) == 0
                ? position.dx - MediaQuery.of(context).size.width / 4
                : position.dx,
            top: box.size.height + position.dy,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 20),
                          child: Text(
                            walkthroughdata.subtitle,
                            textAlign: TextAlign.start,
                          ),
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    //content padding inside button
                                  ),
                                  onPressed: () {
                                    state.walkthroughIndex !=
                                            state.walkthroughData.walkthrough
                                                    .length -
                                                1
                                        ? context.read<WalkthroughBloc>().add(
                                            RequestWalkthroughNextEvent(
                                                walkthroughIndex:
                                                    state.walkthroughIndex))
                                        : Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    state.walkthroughIndex !=
                                            state.walkthroughData.walkthrough
                                                    .length -
                                                1
                                        ? 'Next'
                                        : 'End',
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ))
                          ],
                        )
                      ],
                    )))),
      ]);
    });
  }
}
