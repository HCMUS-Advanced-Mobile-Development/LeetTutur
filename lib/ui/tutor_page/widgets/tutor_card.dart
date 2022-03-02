import 'package:flutter/material.dart';
import 'package:leet_tutur/ui/models/tutor_model.dart';

import '../../../constants/route_constants.dart';
import '../../../generated/l10n.dart';

class TutorCard extends StatefulWidget {
  final TutorModel tutorModel;

  const TutorCard({Key? key, required this.tutorModel}) : super(key: key);

  @override
  _TutorCardState createState() => _TutorCardState();
}

class _TutorCardState extends State<TutorCard> {
  late final TutorModel tutor;

  void handleFavorite() {
    setState(() {
      tutor.isFavorited = !tutor.isFavorited;
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
          backgroundImage: Image.network(tutor.avatar).image,
          radius: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Text(
                tutor.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              onTapDown: navigateToDetail,
            ),
            Text(
              tutor.nation,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            renderStars()
          ],
        ),
        Center(
          child: IconButton(
            icon: tutor.isFavorited
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
            tutor.stars,
            const Icon(
              Icons.star,
              color: Colors.amber,
            )),
        ...List.filled(5 - tutor.stars, const Icon(Icons.star_border))
      ],
    );
  }

  Widget renderSpecialties() {
    return Wrap(
        children: tutor.specialties
            .map((e) => Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                child: Chip(
                  label: Text(e),
                  backgroundColor: Theme.of(context).cardColor,
                  shape: StadiumBorder(
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                )))
            .toList());
  }

  Widget renderButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: handleBookTutor, child: Text(S.current.book.toUpperCase())),
        TextButton(onPressed: handleChatTutor, child: Text(S.current.chat.toUpperCase())),
      ],
    );
  }

  void handleBookTutor() {}

  void handleChatTutor() {}

  @override
  void initState() {
    super.initState();

    setState(() {
      tutor = widget.tutorModel;
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
              children: [
                renderTutorInfoHeader(),
                renderSpecialties(),
                Text(
                  tutor.description,
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
}
