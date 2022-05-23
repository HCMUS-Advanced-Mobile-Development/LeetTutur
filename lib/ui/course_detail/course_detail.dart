import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/course.dart';
import 'package:leet_tutur/stores/course_store.dart';
import 'package:leet_tutur/ui/course_detail/widgets/course_description.dart';
import 'package:leet_tutur/ui/course_detail/widgets/course_explore.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    final _courseStore = GetIt.instance.get<CourseStore>();

    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (context) {
            return Text(_courseStore.selectedCourse?.name ?? "");
          }
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(builder: (context) {
            return _courseStore.selectedCourse != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CourseExplore(
                        course: _courseStore.selectedCourse ?? Course(),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(
                          height: 1,
                        ),
                      ),
                      CourseDescription(
                        course: _courseStore.selectedCourse ?? Course(),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
        ),
      ),
    );
  }
}
