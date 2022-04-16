import 'package:flutter/material.dart';
import 'package:leet_tutur/ui/tutor_page/widgets/specialty_list.dart';
import 'package:leet_tutur/ui/tutor_page/widgets/tutor_list.dart';

class TutorPage extends StatefulWidget {
  const TutorPage({Key? key}) : super(key: key);

  @override
  _TutorPageState createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        SpecialtyList(),
        Expanded(
          child: TutorList(),
        ),
      ],
    );
  }
}
