import 'package:flutter/material.dart';

import '../../../constants/route_constants.dart';
import '../../../models/course_model.dart';
import '../../../widgets/course_card.dart';

class CourseList extends StatefulWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    const englishForKid = "English for Kid";
    var course = CourseModel(
        title: "IELTS Speaking Part 1",
        subTitle:
            "Practice answering Part 1 questions from past years' IELTS exams",
        level: "Any Level",
        numberOfCourse: 8,
        thumbnail:
            "https://camblycurriculumicons.s3.amazonaws.com/5e2b9a72db0da5490226b6b5?h=d41d8cd98f00b204e9800998ecf8427e");

    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(englishForKid, style: Theme.of(context).textTheme.headline6),
        CourseCard(
          courseModel: course,
          onTap: _handleTap,
        ),
        CourseCard(
          courseModel: course,
          onTap: _handleTap,
        ),
        CourseCard(
          courseModel: course,
          onTap: _handleTap,
        )
      ],
    ));
  }

  void _handleTap() {
    Navigator.pushNamed(context, RouteConstants.courseDetail);
  }
}
