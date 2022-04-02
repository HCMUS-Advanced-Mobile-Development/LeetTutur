import 'package:flutter/material.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/course.dart';
import 'package:leet_tutur/ui/courses_page/widgets/course_card.dart';

class CourseExplore extends StatelessWidget {
  final Course course;

  const CourseExplore({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CourseCard(course: course),
        ElevatedButton(
            onPressed: _handleExploreButton,
            child: Text(S.current.explore.toUpperCase()))
      ],
    );
  }

  void _handleExploreButton() {}
}
