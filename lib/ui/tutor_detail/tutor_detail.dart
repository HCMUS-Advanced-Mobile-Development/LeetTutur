import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../../generated/l10n.dart';
import '../models/tutor_model.dart';
import 'widgets/tutor_review.dart';

class TutorDetail extends StatefulWidget {
  const TutorDetail({Key? key}) : super(key: key);

  @override
  State<TutorDetail> createState() => _TutorDetailState();
}

class _TutorDetailState extends State<TutorDetail> {
  final tutor = TutorModel()
    ..avatar = "https://picsum.photos/id/237/200/300"
    ..name = "Kanawa Tengo"
    ..nation = "Japan"
    ..stars = 3
    ..isFavorited = false
    ..specialties = ["IELTS", "Physics", "Math", "Programming", "Witch Craft"]
    ..description =
        "I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching...";

  Widget renderTutorInfoHeader() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(tutor.avatar).image,
          radius: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tutor.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              tutor.nation,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            renderStars()
          ],
        )
      ],
    );
  }

  Widget renderStars() {
    return Row(
      children: [
        ...List.filled(
            tutor.stars,
            const Icon(
              Icons.star,
              color: Colors.amber,
            )),
        ...List.filled(5 - tutor.stars, const Icon(Icons.star_border))
      ],
    );
  }

  void handleFavorite() {
    setState(() {
      tutor.isFavorited = !tutor.isFavorited;
    });
  }

  Widget renderSpecialties() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.current.specialties,
          style: Theme.of(context).textTheme.headline6,
        ),
        Wrap(
            children: tutor.specialties
                .map((e) => Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Chip(
                      label: Text(e),
                      backgroundColor: Theme.of(context).cardColor,
                      shape: StadiumBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor)),
                    )))
                .toList()),
      ],
    );
  }

  Widget renderActions() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {},
          ),
          Text(S.current.chat)
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: tutor.isFavorited
                ? const Icon(Icons.favorite, color: Colors.red, size: 30)
                : const Icon(Icons.favorite_border, size: 30),
            onPressed: handleFavorite,
          ),
          Text(S.current.favorite)
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.report),
            onPressed: () {},
          ),
          Text(S.current.report)
        ],
      )
    ]);
  }

  Widget renderSchedules() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.schedule,
          style: Theme.of(context).textTheme.headline6,
        ),
        Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(14, (index) {
          if (index == 0) {
            return const SizedBox(height: 10);
          }

          final startTime = DateTime(0, 0, 0, 17, 30);
          final endTime = DateTime(0, 0, 0, 17, 55);

          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(TimeOfDay.fromDateTime(
                            startTime.add(Duration(minutes: index * 30)))
                        .format(context) +
                    " - " +
                    TimeOfDay.fromDateTime(
                            endTime.add(Duration(minutes: index * 30)))
                        .format(context)),
                ElevatedButton(onPressed: () {}, child: Text(S.current.book)),
                ElevatedButton(onPressed: () {}, child: Text(S.current.book)),
                ElevatedButton(onPressed: () {}, child: Text(S.current.book)),
              ],
            ),
          );
        })),
      ],
    );
  }

  Widget renderReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.current.review, style: Theme.of(context).textTheme.headline6),
        const TutorReview(),
        const TutorReview(),
        const TutorReview(),
        const TutorReview()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tutor.name.pascalCase),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              renderTutorInfoHeader(),
              const SizedBox(height: 10),
              ExpandableText(
                tutor.description,
                expandText: S.current.showMore.toLowerCase(),
                collapseText: S.current.showLess.toLowerCase(),
                maxLines: 4,
                linkColor: Colors.indigoAccent,
              ),
              const SizedBox(height: 10),
              renderActions(),
              const SizedBox(height: 20),
              renderSpecialties(),
              const SizedBox(height: 20),
              renderSchedules(),
              const SizedBox(height: 20),
              renderReview()
            ],
          ),
        ),
      ),
    );
  }
}
