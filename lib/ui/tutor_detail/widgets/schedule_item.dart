import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/requests/book_request.dart';
import 'package:leet_tutur/models/schedule.dart';
import 'package:leet_tutur/models/schedule_detail.dart';
import 'package:leet_tutur/stores/schedule_store.dart';
import 'package:leet_tutur/utils/date_time_utils.dart';
import 'package:leet_tutur/widgets/text_input.dart';

class ScheduleItem extends StatefulWidget {
  final Schedule schedule;

  const ScheduleItem({Key? key, required this.schedule}) : super(key: key);

  @override
  State<ScheduleItem> createState() => _ScheduleItemState();
}

class _ScheduleItemState extends State<ScheduleItem> {
  final _scheduleStore = GetIt.instance.get<ScheduleStore>();
  late Schedule _schedule;

  @override
  void initState() {
    _schedule = widget.schedule;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              DateTimeUtils.formatDate(
                DateTime.fromMillisecondsSinceEpoch(
                  _schedule.startTimestamp ?? 0,
                ),
              ),
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _schedule.scheduleDetails?.map((detail) {
                  var starStr = TimeOfDay.fromDateTime(
                          DateTime.fromMillisecondsSinceEpoch(
                              detail.startPeriodTimestamp ?? 0))
                      .format(context);

                  var endStr = TimeOfDay.fromDateTime(
                          DateTime.fromMillisecondsSinceEpoch(
                              detail.endPeriodTimestamp ?? 0))
                      .format(context);

                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: ElevatedButton(
                      onPressed: (detail.isBooked ?? false)
                          ? null
                          : () => _handleBookClass(detail),
                      child: Text("$starStr - $endStr" +
                          (detail.isBooked ?? false
                              ? " (${S.current.isBooked})"
                              : "")),
                    ),
                  );
                }).toList() ??
                [],
          ),
        ),
      ],
    );
  }

  void _handleBookClass(ScheduleDetail scheduleDetail) {
    showDialog(
        context: context,
        builder: (context) {
          var starStr = TimeOfDay.fromDateTime(
                  DateTime.fromMillisecondsSinceEpoch(
                      scheduleDetail.startPeriodTimestamp ?? 0))
              .format(context);

          var endStr = TimeOfDay.fromDateTime(
                  DateTime.fromMillisecondsSinceEpoch(
                      scheduleDetail.endPeriodTimestamp ?? 0))
              .format(context);

          var bookTime =
              "$starStr - $endStr ${DateTimeUtils.formatDate(DateTime.fromMillisecondsSinceEpoch(scheduleDetail.startPeriodTimestamp ?? 0))}";

          var note = "";
          return AlertDialog(
            scrollable: true,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(bookTime),
                const SizedBox(
                  height: 20,
                ),
                TextInput(
                  labelText: S.current.classRequirement,
                  onChanged: (text) => note = text,
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();

                  setState(() {
                    scheduleDetail.isBooked = true;
                  });

                  _handleSubmitBookClass(BookRequest(
                    note: note,
                    scheduleDetailIds: [scheduleDetail.id ?? ""],
                  ));
                },
                child: Text(S.current.book),
              )
            ],
          );
        });
  }

  void _handleSubmitBookClass(BookRequest request) {
    var cancelableOperation = CancelableOperation.fromFuture(
        _scheduleStore.bookAsync(request: request));

    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setDialogState) {
            var isCompleted = false;

            cancelableOperation.then((p0) => isCompleted = true);

            return AlertDialog(
              scrollable: true,
              content: Center(
                heightFactor: 1,
                child: isCompleted
                    ? const CircularProgressIndicator()
                    : Text(
                        S.current.done,
                        textAlign: TextAlign.center,
                      ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: Text(S.current.cancel),
                )
              ],
            );
          });
        });
  }
}
