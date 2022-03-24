import 'package:flutter/material.dart';

import '../../../constants/route_constants.dart';
import '../../../generated/l10n.dart';

class LearningHours extends StatefulWidget {
  const LearningHours({Key? key}) : super(key: key);

  @override
  State<LearningHours> createState() => _LearningHoursState();
}

class _LearningHoursState extends State<LearningHours> {
  void _handleLearnHistory() {
    Navigator.pushNamed(context, RouteConstants.learnHistory);
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
              Text(
                "86.5 ${S.current.hours}",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
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
}
