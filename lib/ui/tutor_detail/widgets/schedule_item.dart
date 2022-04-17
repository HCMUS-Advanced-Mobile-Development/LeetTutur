import 'package:flutter/material.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/schedule.dart';
import 'package:leet_tutur/utils/date_time_utils.dart';

class ScheduleItem extends StatefulWidget {
  final Schedule schedule;

  const ScheduleItem({Key? key, required this.schedule}) : super(key: key);

  @override
  State<ScheduleItem> createState() => _ScheduleItemState();
}

class _ScheduleItemState extends State<ScheduleItem> {
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
                      onPressed:
                          (detail.isBooked ?? false) ? () {} : _handleBookClass,
                      style: ElevatedButton.styleFrom(
                        primary:
                            (detail.isBooked ?? false) ? Colors.green : null,
                      ),
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

  void _handleBookClass() {}
}
