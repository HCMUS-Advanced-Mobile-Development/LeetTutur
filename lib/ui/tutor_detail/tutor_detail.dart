import 'package:expandable_text/expandable_text.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/tutor.dart';
import 'package:leet_tutur/stores/tutor_store.dart';
import 'package:leet_tutur/ui/tutor_detail/widgets/feedback_list.dart';
import 'package:leet_tutur/ui/tutor_detail/widgets/report_dialog.dart';
import 'package:leet_tutur/ui/tutor_detail/widgets/schedule_list.dart';
import 'package:leet_tutur/ui/tutor_detail/widgets/tutor_video.dart';
import 'package:leet_tutur/widgets/filter_chips.dart';
import 'package:mobx/mobx.dart';
import 'package:recase/recase.dart';

class TutorDetail extends StatefulWidget {
  const TutorDetail({Key? key}) : super(key: key);

  @override
  State<TutorDetail> createState() => _TutorDetailState();
}

class _TutorDetailState extends State<TutorDetail>
    with SingleTickerProviderStateMixin {
  final _tutorStore = GetIt.instance.get<TutorStore>();
  Tutor _tutor = Tutor();

  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: _selectedIndex,
      length: 2,
      vsync: this,
    );

    _tutorStore
        .getTutorDetail(
          id: _tutorStore.selectedTutorId,
        )
        .then(
          (value) => setState(
            () {
              _tutor = value;
            },
          ),
        );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tutor.user?.name?.pascalCase ?? ""),
      ),
      body: Observer(builder: (context) {
        var selectedTutorFuture = _tutorStore.tutorDetailFuture;
        var shouldShow = selectedTutorFuture != null &&
            selectedTutorFuture.status == FutureStatus.fulfilled;

        return shouldShow
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      renderTutorInfoHeader(),
                      const SizedBox(height: 10),
                      ExpandableText(
                        _tutor.bio ?? "",
                        expandText: S.current.showMore.toLowerCase(),
                        collapseText: S.current.showLess.toLowerCase(),
                        maxLines: 4,
                        linkColor: Colors.indigoAccent,
                      ),
                      const SizedBox(height: 10),
                      renderActions(),
                      const SizedBox(height: 20),
                      TutorVideo(tutor: _tutor),
                      const SizedBox(height: 20),
                      renderSpecialties(),
                      const SizedBox(height: 20),
                      renderTabs(),
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      }),
    );
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
            children: _tutor.specialties
                    ?.split(",")
                    .map((e) => Container(
                        margin: const EdgeInsets.all(5),
                        child: Chip(
                          label: Observer(builder: (context) {
                            return Text(_tutorStore.tutorSpecialtyMap[e] ?? "");
                          }),
                          backgroundColor: Theme.of(context).cardColor,
                          shape: StadiumBorder(
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                        )))
                    .toList() ??
                []),
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
            onPressed: _handleChat,
          ),
          Text(S.current.chat)
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: _tutor.isFavorite ?? false
                ? const Icon(Icons.favorite, color: Colors.red, size: 30)
                : const Icon(Icons.favorite_border, size: 30),
            onPressed: _handleFavorite,
          ),
          Text(S.current.favorite)
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.report),
            onPressed: _handleReport,
          ),
          Text(S.current.report)
        ],
      )
    ]);
  }

  Widget renderTutorInfoHeader() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(_tutor.avatar ?? _tutor.user?.avatar ?? "").image,
          radius: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _tutor.name ?? _tutor.user?.name ?? "",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 5,
            ),
            renderStars(),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Flag.fromString(
                  _tutor.user?.country ?? "",
                  height: 24,
                  width: 36,
                ),
                const SizedBox(
                  width: 5,
                ),
                Observer(
                  builder: (context) {
                    return Text(
                      _tutorStore.tutorCountryCodeMap[
                              _tutor.user?.country?.toUpperCase()] ??
                          "",
                    );
                  },
                ),
              ],
            ),
          ],
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

  Widget renderTabs() {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          onTap: _handleTabClick,
          tabs: [
            Text(
              S.current.schedule,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(S.current.review,
                style: Theme.of(context).textTheme.headline6),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        IndexedStack(
          index: _selectedIndex,
          children: [
            Visibility(
              maintainState: true,
              visible: _selectedIndex == 0,
              child: const ScheduleList(),
            ),
            Visibility(
              maintainState: true,
              visible: _selectedIndex == 1,
              child: FeedbackList(
                userFeedbacks: _tutor.user?.feedbacks ?? [],
              ),
            ),
          ],
        )
      ],
    );
  }

  void _handleFavorite() {
    setState(() {
      _tutor.isFavorite =
          _tutor.isFavorite != null ? !_tutor.isFavorite! : false;
    });

    _tutorStore.addToFavoriteTutorAsync(_tutor.userId);
  }

  void _handleTabClick(int value) {
    setState(() {
      _selectedIndex = value;
      _tabController.animateTo(value);
    });
  }

  void _handleChat() {}

  _handleReport() async {
    showDialog(
        context: context,
        builder: (context) {
          return ReportDialog(
            context: context,
            tutor: _tutor,
          );
        });
  }
}
