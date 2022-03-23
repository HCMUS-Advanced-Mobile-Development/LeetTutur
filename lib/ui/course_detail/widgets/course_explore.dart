import 'package:flutter/material.dart';
import 'package:leet_tutur/widgets/course_card.dart';

import '../../../generated/l10n.dart';
import '../../../models/course_model.dart';

class CourseExplore extends StatelessWidget {
  CourseExplore({Key? key}) : super(key: key);

  final course = CourseModel(
      title: "IELTS Speaking Part 1",
      subTitle:
      "Practice answering Part 1 questions from past years' IELTS exams",
      level: "Any Level",
      numberOfCourse: 8,
      thumbnail:
      "https://camblycurriculumicons.s3.amazonaws.com/5e2b9a72db0da5490226b6b5?h=d41d8cd98f00b204e9800998ecf8427e");

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CourseCard(courseModel: course),
        ElevatedButton(onPressed: _handleExploreButton, child: Text(S.current.explore.toUpperCase()))
      ],
    );
  }

  void _handleExploreButton() {
  }
}
