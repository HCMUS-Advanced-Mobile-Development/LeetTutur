import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/stores/course_store.dart';
import 'package:leet_tutur/ui/courses_page/widgets/course_card.dart';
import 'package:leet_tutur/utils/iterable_extensions.dart';
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
    const englishForKid = "English for Kid";

    return Observer(builder: (context) {
      var courses = _courseStore.courseResponseFuture?.value?.data?.rows ?? [];
      var coursesGroupByCategory = courses.groupBy((c) => c.categories?[0].key ?? "");

      return _courseStore.courseResponseFuture?.status == FutureStatus.fulfilled
          ? ListView.separated(
              itemCount: coursesGroupByCategory.length,
              itemBuilder: (context, index) {
                var coursesByLevel = coursesGroupByCategory.values.elementAt(index);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(coursesByLevel.first.categories?[0].title ?? "",
                        style: Theme.of(context).textTheme.headline6),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: coursesByLevel.length,
                      itemBuilder: (context, index) {
                        return CourseCard(course: coursesByLevel[index]);
                      },
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            );
    });
  }

  void _handleTap() {
    Navigator.pushNamed(context, RouteConstants.courseDetail);
  }
}
