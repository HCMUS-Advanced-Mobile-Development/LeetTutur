import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';

import '../../constants/route_constants.dart';
import '../../generated/l10n.dart';
import '../models/tutor_model.dart';

class LearnHistory extends StatefulWidget {
  const LearnHistory({Key? key}) : super(key: key);

  @override
  State<LearnHistory> createState() => _LearnHistoryState();
}

class _LearnHistoryState extends State<LearnHistory> {
  final TutorModel tutor = TutorModel()
    ..avatar = "https://picsum.photos/id/237/200/300"
    ..name = "Kanawa Tengo"
    ..nation = "Japan"
    ..stars = 3
    ..isFavorited = false
    ..specialties = ["IELTS", "Physics", "Math", "Programming", "Witch Craft"]
    ..description =
        "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching...";

  Widget renderLearnedClass() {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TimeOfDay.fromDateTime(dateTime
                                    .add(const Duration(minutes: 1 * 30)))
                                .format(context) +
                            " - " +
                            TimeOfDay.fromDateTime(dateTime
                                    .add(const Duration(minutes: 1 * 30)))
                                .format(context),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      ExpansionTile(
                        title: Text(
                          S.current.classRequirement,
                        ),
                        children: const [
                          ListTile(title: Text("Omae wa mo shindeiru!"))
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RouteConstants.learnHistory.titleCase),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 50),
          child: Column(
            children: [
              renderLearnedClass(),
              renderLearnedClass(),
              renderLearnedClass(),
              renderLearnedClass(),
              renderLearnedClass(),
              renderLearnedClass(),
              renderLearnedClass(),
              renderLearnedClass(),
              renderLearnedClass(),
            ],
          ),
        ),
      ),
    );
  }
}
