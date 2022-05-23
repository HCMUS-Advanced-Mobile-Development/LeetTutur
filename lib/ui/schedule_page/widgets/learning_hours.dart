import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/stores/schedule_store.dart';
import 'package:mobx/mobx.dart';
import 'package:recase/recase.dart';

class LearningHours extends StatefulWidget {
  const LearningHours({Key? key}) : super(key: key);

  @override
  State<LearningHours> createState() => _LearningHoursState();
}

class _LearningHoursState extends State<LearningHours> {
  final _scheduleStore = GetIt.instance.get<ScheduleStore>();

  @override
  void initState() {
    _scheduleStore.getTotalLearnedHoursAsync();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                S.current.yourTotalLearnedHoursAre,
                textAlign: TextAlign.center,
              ),
              Observer(builder: (context) {
                var future = _scheduleStore.totalLearnedHoursFuture;
                var duration = future?.value ?? Duration.zero;

                return future?.status == FutureStatus.fulfilled
                    ? Text(
                        "${duration.inHours} ${S.current.hours.titleCase} ${duration.inMinutes % 60} ${S.current.minutes.titleCase}",
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      )
                    : const CircularProgressIndicator();
              }),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: _handleLearnHistory,
                  child: Text(S.current.learningHistory.toUpperCase()))
            ],
          ),
        ),
      ),
    );
  }

  void _handleLearnHistory() {
    Navigator.pushNamed(context, RouteConstants.learnHistory);
  }
}
