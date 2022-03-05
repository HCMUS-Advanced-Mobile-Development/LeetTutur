import 'package:flutter/material.dart';
import 'package:leet_tutur/ui/course_detail/widgets/course_description.dart';
import 'package:leet_tutur/ui/course_detail/widgets/course_explore.dart';
import 'package:recase/recase.dart';

import '../../constants/route_constants.dart';
import '../../generated/l10n.dart';
import '../../models/course_model.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  var course = CourseModel(
      title: "IELTS Speaking Part 1",
      subTitle:
          "Practice answering Part 1 questions from past years' IELTS exams",
      level: "Any Level",
      numberOfCourse: 8,
      thumbnail:
          "https://camblycurriculumicons.s3.amazonaws.com/5e2b9a72db0da5490226b6b5?h=d41d8cd98f00b204e9800998ecf8427e");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RouteConstants.courseDetail.titleCase),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CourseExplore(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  height: 1,
                ),
              ),
              CourseDescription()
            ],
          ),
        ),
      ),
    );
  }
}
