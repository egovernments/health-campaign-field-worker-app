import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';

import '../models/entities/downsync.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/localized.dart';

class AcknowledgementPage extends LocalizedStatefulWidget {
  bool isDataRecordSuccess;
  final DownsyncModel? result;

  AcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.isDataRecordSuccess = false,
    this.result,
  });

  @override
  State<AcknowledgementPage> createState() => _AcknowledgementPageState();
}


class _AcknowledgementPageState extends LocalizedState<AcknowledgementPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    int? epochTime = widget.result?.lastSyncedTime;

    String date= DigitDateUtils.getDateFromTimestamp(epochTime!);
    String dataDescription = "Download Report:\n\n\nBoundary: ${widget.result?.locality}\nStatus: Download Completed\nDownloaded On: ${date}\nRecords Downloaded: ${widget.result?.totalCount}/${widget.result?.totalCount}";


    return Scaffold(
      body: widget.isDataRecordSuccess
          ? DigitAcknowledgement.success(
        description: dataDescription,
        label: localizations
            .translate(i18.acknowledgementSuccess.acknowledgementLabelText),
        isActionLabel: false,
      )
          : DigitAcknowledgement.success(
        action: () {
          context.router.pop();
        },
        actionLabel:
        localizations.translate(i18.acknowledgementSuccess.actionLabelText),
        description: localizations.translate(
            i18.acknowledgementSuccess.acknowledgementDescriptionText),
        label: localizations
            .translate(i18.acknowledgementSuccess.acknowledgementLabelText),
      ),
      bottomNavigationBar: Offstage(
        offstage: !widget.isDataRecordSuccess,
        // Show the bottom navigation bar if `isDataRecordSuccess` is true
        child: SizedBox(
          height: 145,
          child: DigitCard(
            margin: const EdgeInsets.only(left: 0, right: 0),
            child: Column(
              children: [
                DigitElevatedButton(
                    child: Text(localizations.translate(i18.acknowledgementSuccess.goToHome)),
                    onPressed: () {context.router.pop();}),
                const SizedBox(
                  height: 12,
                ),
                DigitOutLineButton(
                  onPressed: () {context.router.popAndPush(BoundarySelectionRoute());},
                  label: localizations
                      .translate(i18.acknowledgementSuccess.downloadmoredata),
                  buttonStyle: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      width: 1.0,
                      color: theme.colorScheme.secondary,
                    ),
                    minimumSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
