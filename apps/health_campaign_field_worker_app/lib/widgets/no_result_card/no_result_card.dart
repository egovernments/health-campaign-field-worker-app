import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoResultCard extends StatelessWidget {
  final AlignmentGeometry align;
  final String? label;
  const NoResultCard({
    super.key,
    this.align = Alignment.centerLeft,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 8),
        child: Column(
          children: [
            SvgPicture.asset('assets/icons/svg/no_result.svg'),
            const SizedBox(height: 20),
            Text(
              label ?? '',
            ),
          ],
        ),
      ),
    );
  }
}
