import 'package:flutter/material.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/course_model.dart';


class CourseDescription extends StatelessWidget {
  CourseDescription({Key? key}) : super(key: key);

  final course = CourseModel(
      title: "IELTS Speaking Part 1",
      subTitle:
          "Practice answering Part 1 questions from past years' IELTS exams",
      level: "Any Level",
      numberOfCourse: 8,
      thumbnail:
          "https://camblycurriculumicons.s3.amazonaws.com/5e2b9a72db0da5490226b6b5?h=d41d8cd98f00b204e9800998ecf8427e",
      courseTarget:
          "Feeling confident answering Part 1 questions will help you get off to a strong start on your IELTS speaking exam.",
      courseOutcome:
          "You'll practice giving strong answers in Part 1, with tips and tricks recommended by real IELTS examiners.",
      topics: [
        "Holidays and Vacations",
        "Art",
        "Education",
        "News and Media",
        "Nature and Environment",
        "Friends",
        "Food and Restaurants",
        "Technology"
      ]);

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
        const SizedBox(height: 100)
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
        Text(course.courseTarget!),
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
        Text(course.courseOutcome!),
      ],
    );
  }

  Widget _renderTopics(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.topics,
          style: Theme.of(context).textTheme.headline6,
        ),
        ...List.generate(course.topics?.length ?? 0, (index) {
          return Text("${index + 1} ${course.topics![index]}");
        })
      ],
    );
  }
}
