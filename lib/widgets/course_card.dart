import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../models/course_model.dart';

class CourseCard extends StatelessWidget {
  final CourseModel courseModel;

  final void Function()? onTap;

  const CourseCard({Key? key, required this.courseModel, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                courseModel.thumbnail!,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                courseModel.title!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                courseModel.subTitle!,
                style: Theme.of(context).textTheme.caption,
              ),
              Row(
                children: [
                  Text(courseModel.level!),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Text("·", style: TextStyle(fontSize: 30)),
                  ),
                  Text(
                      "${courseModel.numberOfCourse!.toString()} ${S.current.lessons}")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
