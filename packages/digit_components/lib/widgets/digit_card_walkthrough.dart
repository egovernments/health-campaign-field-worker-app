// ignore_for_file: avoid_returning_null_for_void

import 'package:digit_components/widgets/digit_pointer.dart';
import 'package:flutter/material.dart';
import 'package:digit_components/digit_components.dart';

class DigitCardWalkthrough extends StatelessWidget {
  final Function? onnext;
  final RenderBox? box;

  const DigitCardWalkthrough(this.onnext, this.box, {super.key});

  static Future<T?> show<T>(BuildContext context) => showGeneralDialog(
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 700),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          int activeIndx = 2;
          RenderBox? box = ((GlobalObjectKey('$activeIndx'))
              .currentContext!
              .findRenderObject() as RenderBox?);

          return DigitCardWalkthrough(null, box);
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
    Offset position = box!.localToGlobal(Offset.zero);
    return Stack(children: [
      Positioned(
        left: position.dx,
        top: position.dy,
        child: SizedBox(
            width: box!.size.width,
            child: DigitIconCard(
              icon: Icons.all_inbox,
              label: 'View Beneficiaries',
              onPressed: () {
                AppLogger.instance.info("Icon Clicked");
              },
            )),
      ),
      Positioned(
          left: position.dx + 5,
          top: box!.size.height + position.dy,
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
    ]);
  }
}
