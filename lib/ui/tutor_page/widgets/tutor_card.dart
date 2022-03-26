import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/tutor.dart';
import 'package:leet_tutur/stores/tutor_store/tutor_store.dart';

class TutorCard extends StatefulWidget {
  final Tutor tutor;

  const TutorCard({Key? key, required this.tutor}) : super(key: key);

  @override
  _TutorCardState createState() => _TutorCardState();
}

class _TutorCardState extends State<TutorCard> {
  final tutorStore = GetIt.instance.get<TutorStore>();

  late final Tutor tutor;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();

    setState(() {
      tutor = widget.tutor;
      isFavorite = tutorStore.isFavoriteTutor(tutor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                renderTutorInfoHeader(),
                renderSpecialties(),
                Text(
                  tutor.bio!,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                renderButtons()
              ],
            ),
          )
        ],
      ),
    );
  }

  void handleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void navigateToDetail(TapDownDetails tapDownDetails) {
    Navigator.pushNamed(context, RouteConstants.tutorDetail);
  }

  Widget renderTutorInfoHeader() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(tutor.avatar!).image,
          radius: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Text(
                tutor.name!,
                style: Theme.of(context).textTheme.headline6,
              ),
              onTapDown: navigateToDetail,
            ),
            Text(
              tutor.country!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            renderStars()
          ],
        ),
        Center(
          child: IconButton(
            icon: isFavorite
                ? const Icon(Icons.favorite, color: Colors.red, size: 30)
                : const Icon(Icons.favorite_border, size: 30),
            onPressed: handleFavorite,
          ),
        )
      ],
    );
  }

  Widget renderStars() {
    return Row(
      children: [
        ...List.filled(
            tutor.getStars(),
            const Icon(
              Icons.star,
              color: Colors.amber,
            )),
        ...List.filled(5 - tutor.getStars(), const Icon(Icons.star_border))
      ],
    );
  }

  Widget renderSpecialties() {
    return Wrap(
        children: tutor.specialties
                ?.split(",")
                .map((e) => Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Chip(
                      label: Text(e),
                      backgroundColor: Theme.of(context).cardColor,
                      shape: StadiumBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor)),
                    )))
                .toList() ??
            []);
  }

  Widget renderButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: handleBookTutor,
            child: Text(S.current.book.toUpperCase())),
        TextButton(
            onPressed: handleChatTutor,
            child: Text(S.current.chat.toUpperCase())),
      ],
    );
  }

  void handleBookTutor() {}

  void handleChatTutor() {}
}
