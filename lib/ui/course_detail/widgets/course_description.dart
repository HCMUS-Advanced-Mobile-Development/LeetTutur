import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/course.dart';
import 'package:leet_tutur/stores/course_store.dart';

class CourseDescription extends StatelessWidget {
  final Course course;
  final _courseStore = GetIt.instance.get<CourseStore>();

  CourseDescription({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _renderOverall(context),
        const SizedBox(
          height: 10,
        ),
        _renderTopics(context),
      ],
    );
  }

  Widget _renderOverall(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.overall,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Icon(
              Icons.help_outline,
              color: Colors.deepOrangeAccent,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              S.current.whyYouShouldLearnThisCourse,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        Text(course.reason ?? ""),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Icon(
              Icons.help_outline,
              color: Colors.deepOrangeAccent,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              S.current.whatYouAchieve,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        Text(course.purpose ?? ""),
      ],
    );
  }

  Widget _renderTopics(BuildContext context) {
    var topics = course.topics ?? [];
    topics.sort((a, b) => a.orderCourse?.compareTo(b.orderCourse ?? 0) ?? 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.topics,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            return ListTile(
              enableFeedback: true,
              title: Text(
                "${index + 1}. ${topics[index].name}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
                _courseStore.selectedTopic = topics[index];
                Navigator.pushNamed(context, RouteConstants.pdfViewer);
              },
            );
          },
          itemCount: topics.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        )
      ],
    );
  }
}
