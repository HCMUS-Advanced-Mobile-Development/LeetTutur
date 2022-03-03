import 'package:flutter/material.dart';
import 'package:leet_tutur/ui/schedule_page/widgets/learning_hours.dart';
import 'package:leet_tutur/ui/schedule_page/widgets/upcoming_classes.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: const [
              LearningHours(),
              SizedBox(height: 15),
              UpcomingClasses(),
            ],
          ),
        ),
      ),
    );
  }
}
