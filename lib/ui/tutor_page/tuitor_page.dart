import 'package:flutter/material.dart';
import 'package:leet_tutur/ui/models/tutor_model.dart';
import 'package:leet_tutur/ui/tutor_page/widgets/search_bar.dart';
import 'package:leet_tutur/ui/tutor_page/widgets/tutor_card.dart';

import '../../constants/search_bar_constants.dart';

class TutorPage extends StatefulWidget {
  const TutorPage({Key? key}) : super(key: key);

  @override
  _TutorPageState createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
              10, SearchBarConstants.defaultHeight + 20, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TutorCard(
                    tutorModel: TutorModel()
                      ..avatar = "https://picsum.photos/id/237/200/300"
                      ..name = "Kanawa Tengo"
                      ..nation = "Japan"
                      ..stars = 3
                      ..isFavorited = false
                      ..specialties = [
                        "IELTS",

                        "Physics",
                        "Math",
                        "Programming",
                        "Witch Craft"
                      ]
                      ..description =
                          "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching..."),
                TutorCard(
                    tutorModel: TutorModel()
                      ..avatar = "https://picsum.photos/id/238/200/300"
                      ..name = "Tamura Kafka"
                      ..nation = "Japan"
                      ..stars = 4
                      ..isFavorited = true
                      ..specialties = [
                        "Philosopy",
                        "Literature",
                      ]
                      ..description =
                          "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching..."),
                TutorCard(
                    tutorModel: TutorModel()
                      ..avatar = "https://picsum.photos/id/239/200/300"
                      ..name = "Fukaeri Erika"
                      ..nation = "Japan"
                      ..stars = 3
                      ..isFavorited = false
                      ..specialties = ["Sewing", "Story Telling"]
                      ..description =
                          "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching..."),
              ],
            ),
          ),
        ),
        const SearchBar()
      ],
    );
  }
}
