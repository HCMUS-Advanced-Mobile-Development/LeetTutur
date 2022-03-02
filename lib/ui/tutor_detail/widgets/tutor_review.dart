import 'package:flutter/material.dart';

class TutorReview extends StatefulWidget {
  const TutorReview({Key? key}) : super(key: key);

  @override
  State<TutorReview> createState() => _TutorReviewState();
}

class _TutorReviewState extends State<TutorReview> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Homura", style: Theme.of(context).textTheme.bodyMedium),
              Text("I love this guy", style: Theme.of(context).textTheme.caption)
            ],
          ),
        ),
      ),
    );
  }
}
