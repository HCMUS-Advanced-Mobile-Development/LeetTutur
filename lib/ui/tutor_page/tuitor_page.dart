import 'package:flutter/material.dart';
import 'package:leet_tutur/constants/search_bar_constants.dart';
import 'package:leet_tutur/ui/tutor_page/widgets/tutor_list.dart';
import 'package:leet_tutur/widgets/search_bar.dart';

class TutorPage extends StatefulWidget {
  const TutorPage({Key? key}) : super(key: key);

  @override
  _TutorPageState createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(
              10, SearchBarConstants.defaultHeight + 20, 10, 0),
          child: TutorList(),
        ),
        SearchBar()
      ],
    );
  }
}
