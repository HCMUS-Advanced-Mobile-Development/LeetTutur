import 'package:flutter/material.dart';
import 'package:leet_tutur/ui/courses_page/widgets/course_list.dart';

import '../../constants/search_bar_constants.dart';
import '../../widgets/search_bar.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(
              10, SearchBarConstants.defaultHeight + 20, 10, 0),
          child: CourseList(),
        ),
        SearchBar(),
      ]),
    );
  }
}
