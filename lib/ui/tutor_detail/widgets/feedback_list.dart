import 'package:flutter/material.dart';
import 'package:leet_tutur/models/user_feedback.dart';
import 'package:leet_tutur/ui/tutor_detail/widgets/tutor_review.dart';
import 'package:leet_tutur/widgets/empty_page.dart';

class FeedbackList extends StatefulWidget {
  final List<UserFeedback> userFeedbacks;

  const FeedbackList({Key? key, required this.userFeedbacks}) : super(key: key);

  @override
  State<FeedbackList> createState() => _FeedbackListState();
}

class _FeedbackListState extends State<FeedbackList> {
  @override
  Widget build(BuildContext context) {
    var feedbacks = widget.userFeedbacks;
    return feedbacks.isNotEmpty ? ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var userFeedback = feedbacks[index];

        return TutorReview(userFeedback: userFeedback);
      },
      itemCount: feedbacks.length,
    ) : const EmptyPage();
  }
}
