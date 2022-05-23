import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/booking_info.dart';
import 'package:leet_tutur/stores/schedule_store.dart';
import 'package:leet_tutur/utils/date_time_utils.dart';

class UpcomingItem extends StatefulWidget {
  final List<BookingInfo> bookingInfos;
  final Function() refresh;

  const UpcomingItem(
      {Key? key, required this.bookingInfos, required this.refresh})
      : super(key: key);

  @override
  State<UpcomingItem> createState() => _UpcomingItemState();
}

class _UpcomingItemState extends State<UpcomingItem> {
  final _scheduleStore = GetIt.instance.get<ScheduleStore>();

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

                      var isJoinable = e.scheduleDetailInfo?.endPeriodTimestamp
                          ?.compareTo(DateTime.now().millisecondsSinceEpoch) ?? 0;

                      var isCancelable = DateTime.now().difference(
                        DateTime.fromMillisecondsSinceEpoch(
                          e.scheduleDetailInfo?.startPeriodTimestamp ?? 0,
                        ),
                      );
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () => isJoinable > 0 ? _handleJoinClass(e) : null,
                                  child: Text("$startPeriod - $endPeriod")),
                            ),
                            IconButton(
                              onPressed: isCancelable.inHours >= -2
                                  ? null
                                  : () => _handleCancelClass(e),
                              icon: const Icon(Icons.highlight_off),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      );
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

  void _handleJoinClass(BookingInfo bookingInfo) {
    _scheduleStore.selectedClass = bookingInfo;
    Navigator.pushNamed(context, RouteConstants.studyRoom);
  }

  void _handleCancelClass(BookingInfo bookingInfo) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(S.current.areYouSureWantToCancelClass),
            actions: [
              TextButton(
                onPressed: () => _handleSubmitCancelClass(bookingInfo),
                child: Text(
                  S.current.yes,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
                child: Text(S.current.no),
              ),
            ],
          );
        });
  }

  _handleSubmitCancelClass(BookingInfo bookingInfo) async {
    await _scheduleStore.cancelClassAsync(
      scheduleDetailIds: [bookingInfo.scheduleDetailId ?? ""],
    );
    widget.refresh.call();
    Navigator.of(context, rootNavigator: true).pop();
  }
}
