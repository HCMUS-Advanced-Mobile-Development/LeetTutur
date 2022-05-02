import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/course.dart';
import 'package:leet_tutur/stores/course_store.dart';
import 'package:leet_tutur/ui/courses_page/widgets/course_card.dart';

class CourseExplore extends StatelessWidget {
  final Course course;

  const CourseExplore({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _courseStore = GetIt.instance.get<CourseStore>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CourseCard(course: course),
        ElevatedButton(
            onPressed: () async {
              _courseStore.selectedTopic = null;
              _courseStore.selectedCourse = course;
              await Navigator.pushNamed(context, RouteConstants.pdfViewer);
            },
            child: Text(S.current.explore.toUpperCase()))
      ],
    );
  }
}
