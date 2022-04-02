import 'package:flutter/material.dart';
import 'package:leet_tutur/models/user_feedback.dart';

class TutorReview extends StatefulWidget {
  final UserFeedback userFeedback;

  const TutorReview({Key? key, required this.userFeedback}) : super(key: key);

  @override
  State<TutorReview> createState() => _TutorReviewState();
}

class _TutorReviewState extends State<TutorReview> {

  @override
  Widget build(BuildContext context) {
    final userFeedback = widget.userFeedback;
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userFeedback.firstInfo?.name ?? "Unknown", style: Theme.of(context).textTheme.bodyMedium),
              Text(userFeedback.content ?? "", style: Theme.of(context).textTheme.caption)
            ],
          ),
        ),
      ),
    );
  }
}
