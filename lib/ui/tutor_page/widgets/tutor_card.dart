import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/tutor.dart';
import 'package:leet_tutur/stores/tutor_store.dart';

class TutorCard extends StatefulWidget {
  final Tutor tutor;

  const TutorCard({Key? key, required this.tutor}) : super(key: key);

  @override
  _TutorCardState createState() => _TutorCardState();
}

class _TutorCardState extends State<TutorCard> {
  final _tutorStore = GetIt.instance.get<TutorStore>();

  late final Tutor _tutor;
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();

    setState(() {
      _tutor = widget.tutor;
      _isFavorite = _tutorStore.isFavoriteTutor(_tutor);
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
                  _tutor.bio!,
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
      _isFavorite = !_isFavorite;
    });

    _tutorStore.addToFavoriteTutorAsync(_tutor.userId);
  }

  Future navigateToDetail(TapDownDetails _) async {
    _tutorStore.selectedTutorId = _tutor.userId ?? "";

    await Navigator.pushNamed(context, RouteConstants.tutorDetail);
    setState(() {
      _isFavorite = _tutorStore.isFavoriteTutor(_tutor);
    });
  }

  Widget renderTutorInfoHeader() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(_tutor.avatar!).image,
          radius: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Text(
                _tutor.name!,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              onTapDown: navigateToDetail,
            ),
            renderStars(),
            Row(
              children: [
                Flag.fromString(
                  _tutor.country ?? "",
                  height: 16,
                  width: 28,
                ),
                Observer(
                  builder: (context) {
                    return Text(
                      _tutorStore.tutorCountryCodeMap[
                              _tutor.country?.toUpperCase()] ??
                          "",
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        Center(
          child: IconButton(
            icon: _isFavorite
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
            _tutor.getStars(),
            const Icon(
              Icons.star,
              color: Colors.amber,
            )),
        ...List.filled(5 - _tutor.getStars(), const Icon(Icons.star_border))
      ],
    );
  }

  Widget renderSpecialties() {
    return Wrap(
        children: _tutor.specialties
                ?.split(",")
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Container(
                          margin: const EdgeInsets.only(left: 5, right: 5),
                          child: Chip(
                            label: Observer(builder: (context) {
                              return Text(
                                  _tutorStore.tutorSpecialtyMap[e] ?? "");
                            }),
                            backgroundColor: Theme.of(context).cardColor,
                            shape: StadiumBorder(
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                          )),
                    ))
                .toList() ??
            []);
  }

  Widget renderButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: handleBookTutor,
          child: Text(
            S.current.book.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        TextButton(
          onPressed: handleChatTutor,
          child: Text(
            S.current.chat.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  void handleBookTutor() {
    navigateToDetail(TapDownDetails());
  }

  void handleChatTutor() {}
}
