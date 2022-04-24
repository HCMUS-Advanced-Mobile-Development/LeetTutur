import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/models/course.dart';
import 'package:leet_tutur/stores/course_store.dart';
import 'package:leet_tutur/ui/courses_page/widgets/course_card.dart';
import 'package:leet_tutur/widgets/error_page.dart';
import 'package:mobx/mobx.dart';

class CourseList extends StatefulWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  final _courseStore = GetIt.instance.get<CourseStore>();

  @override
  void initState() {
    _courseStore.getCoursesAsync();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      var coursesGroupByCategory = _courseStore.coursesByLevel;

      switch(_courseStore.courseResponseFuture?.status) {
        case FutureStatus.pending:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case FutureStatus.rejected:
          return const Center(
            child: ErrorPage(),
          );
        case FutureStatus.fulfilled:
          return RefreshIndicator(
            onRefresh: () async {
              await _courseStore.getCoursesAsync();
            },
            child: ListView.separated(
              itemCount: coursesGroupByCategory.length,
              itemBuilder: (context, index) {
                var coursesByLevel =
                coursesGroupByCategory.values.elementAt(index);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(coursesByLevel.first.categories?[0].title ?? "",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6),
                    SizedBox(
                      height: 325,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        itemCount: coursesByLevel.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 300,
                            child: CourseCard(
                              course: coursesByLevel[index],
                              onTap: _handleTap,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          );
        default:
          return const Center(
            child: CircularProgressIndicator(),
          );
      }
    });
  }

  void _handleTap(Course? course) {
    _courseStore.selectedCourse = course;
    Navigator.pushNamed(context, RouteConstants.courseDetail);
  }
}
