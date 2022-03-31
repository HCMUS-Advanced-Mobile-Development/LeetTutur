import 'package:flutter/material.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/booking_info.dart';
import 'package:leet_tutur/utils/date_time_utils.dart';

class LearnHistoryItem extends StatelessWidget {
  final BookingInfo bookingInfo;

  const LearnHistoryItem({Key? key, required this.bookingInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      DateTimeUtils.formatDate(
                          DateTime.fromMillisecondsSinceEpoch(bookingInfo
                                  .scheduleDetailInfo?.startPeriodTimestamp ??
                              0)),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                        bookingInfo.scheduleDetailInfo?.scheduleInfo?.tutorInfo
                                ?.name ??
                            "",
                        style: Theme.of(context).textTheme.bodyLarge)
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${bookingInfo.scheduleDetailInfo?.startPeriod} - ${bookingInfo.scheduleDetailInfo?.endPeriod}",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      ExpansionTile(
                        title: Text(
                          S.current.classRequirement,
                        ),
                        children: [
                          ListTile(
                              title: Text(bookingInfo.studentRequest ?? S.current.empty))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
