import 'package:flutter/material.dart';
import 'package:leet_tutur/generated/l10n.dart';

class ScheduleList extends StatefulWidget {
  const ScheduleList({Key? key}) : super(key: key);

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(14, (index) {
          if (index == 0) {
            return const SizedBox(height: 10);
          }

          final startTime = DateTime(0, 0, 0, 17, 30);
          final endTime = DateTime(0, 0, 0, 17, 55);

          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(TimeOfDay.fromDateTime(
                    startTime.add(Duration(minutes: index * 30)))
                    .format(context) +
                    " - " +
                    TimeOfDay.fromDateTime(
                        endTime.add(Duration(minutes: index * 30)))
                        .format(context)),
                ElevatedButton(onPressed: () {}, child: Text(S.current.book)),
                ElevatedButton(onPressed: () {}, child: Text(S.current.book)),
                ElevatedButton(onPressed: () {}, child: Text(S.current.book)),
              ],
            ),
          );
        }));
  }
}
