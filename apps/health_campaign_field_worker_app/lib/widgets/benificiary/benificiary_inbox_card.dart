import 'package:digit_components/widgets/digit_card.dart';
import 'package:flutter/material.dart';

class BenificiaryInboxCard extends StatelessWidget {
  final String firstInbox;
  final String secondInbox;
  final String firstInboxContent;
  final String secondInboxContent;
  const BenificiaryInboxCard({
    super.key,
    required this.firstInbox,
    required this.secondInbox,
    required this.firstInboxContent,
    required this.secondInboxContent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DigitCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  firstInbox,
                  style: theme.textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                Text(
                  firstInboxContent,
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              children: [
                Text(
                  secondInbox,
                  style: theme.textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                Text(
                  secondInboxContent,
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
