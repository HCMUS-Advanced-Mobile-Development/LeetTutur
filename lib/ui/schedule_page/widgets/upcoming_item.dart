import 'package:flutter/material.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/models/booking_info.dart';
import 'package:leet_tutur/utils/date_time_utils.dart';

class UpcomingItem extends StatefulWidget {
  final List<BookingInfo> bookingInfos;

  const UpcomingItem({Key? key, required this.bookingInfos}) : super(key: key);

  @override
  State<UpcomingItem> createState() => _UpcomingItemState();
}

class _UpcomingItemState extends State<UpcomingItem> {
  @override
  Widget build(BuildContext context) {
    final bookingInfos = widget.bookingInfos;

    var bookedDate = DateTimeUtils.formatDate(
        DateTime.fromMillisecondsSinceEpoch(
            bookingInfos[0].scheduleDetailInfo?.startPeriodTimestamp ?? 0));
    var tutorName =
        bookingInfos[0].scheduleDetailInfo?.scheduleInfo?.tutorInfo?.name ?? "";

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          bookedDate,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          tutorName,
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: bookingInfos.map((e) {
                      var startPeriod = e.scheduleDetailInfo?.startPeriod ?? "";
                      var endPeriod = e.scheduleDetailInfo?.endPeriod ?? "";
                      return ElevatedButton(
                          onPressed: _handleJoinClass,
                          child: Text("$startPeriod - $endPeriod"));
                    }).toList(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _handleJoinClass() {
    Navigator.pushNamed(context, RouteConstants.studyRoom);
  }
}
