import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/route_constants.dart';
import '../../../generated/l10n.dart';
import '../../../models/tutor_model.dart';

class UpcomingClasses extends StatefulWidget {
  const UpcomingClasses({Key? key}) : super(key: key);

  @override
  State<UpcomingClasses> createState() => _UpcomingClassesState();
}

class _UpcomingClassesState extends State<UpcomingClasses> {
  final TutorModel tutor = TutorModel()
    ..avatar = "https://picsum.photos/id/237/200/300"
    ..name = "Kanawa Tengo"
    ..nation = "Japan"
    ..stars = 3
    ..isFavorited = false
    ..specialties = ["IELTS", "Physics", "Math", "Programming", "Witch Craft"]
    ..description =
        "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching...";

  Widget renderClass() {
    final dateTime = DateTime.now();

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
                      DateFormat("dd-MMM-yyyy").format(dateTime),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(tutor.name,
                        style: Theme.of(context).textTheme.bodyLarge)
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(5, (index) {
                        final startTime = DateTime(0, 0, 0, 17, 30);
                        final endTime = DateTime(0, 0, 0, 17, 55);

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ElevatedButton(
                            onPressed: _handleJoinClass,
                            child: Text(
                              TimeOfDay.fromDateTime(startTime
                                          .add(Duration(minutes: index * 30)))
                                      .format(context) +
                                  " - " +
                                  TimeOfDay.fromDateTime(endTime
                                          .add(Duration(minutes: index * 30)))
                                      .format(context),
                            ),
                          ),
                        );
                      })),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          S.current.upcomingClasses,
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(
          height: 5,
        ),
        renderClass(),
        renderClass(),
        renderClass(),
        renderClass(),
      ],
    );
  }

  void _handleJoinClass() {
    Navigator.pushNamed(context, RouteConstants.studyRoom);
  }
}
