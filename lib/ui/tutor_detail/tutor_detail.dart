import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/tutor.dart';
import 'package:leet_tutur/stores/tutor_store/tutor_store.dart';
import 'package:leet_tutur/ui/tutor_detail/widgets/feedback_list.dart';
import 'package:leet_tutur/ui/tutor_detail/widgets/schedule_list.dart';
import 'package:mobx/mobx.dart';
import 'package:recase/recase.dart';

class TutorDetail extends StatefulWidget {
  const TutorDetail({Key? key}) : super(key: key);

  @override
  State<TutorDetail> createState() => _TutorDetailState();
}

class _TutorDetailState extends State<TutorDetail> with SingleTickerProviderStateMixin {
  final tutorStore = GetIt.instance.get<TutorStore>();
  Tutor tutor = Tutor();

  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    tabController = TabController(
      initialIndex: selectedIndex,
      length: 2,
      vsync: this,
    );

    tutorStore.getTutorDetail(id: "0").then((value) => setState(() {
          tutor = value;
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tutor.user?.name?.pascalCase ?? ""),
      ),
      body: Observer(builder: (context) {
        var selectedTutorFuture = tutorStore.selectedTutorFuture;
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
                        tutor.bio ?? "",
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
            onPressed: () {},
          ),
          Text(S.current.chat)
        ],
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: tutor.isFavorite ?? false
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

  Widget renderTutorInfoHeader() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(tutor.avatar ?? tutor.user?.avatar ?? "").image,
          radius: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tutor.name ?? tutor.user?.name ?? "",
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              tutor.country ?? "",
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
            tutor.getStars(),
            const Icon(
              Icons.star,
              color: Colors.amber,
            )),
        ...List.filled(5 - tutor.getStars(), const Icon(Icons.star_border))
      ],
    );
  }

  Widget renderTabs() {
    return Column(

      children: [
        TabBar(
          controller: tabController,
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
        IndexedStack(
          index: selectedIndex,
          children: [
            Visibility(
              maintainState: true,
              visible: selectedIndex == 0,
              child: const ScheduleList(),
            ),
            Visibility(
              maintainState: true,
              visible: selectedIndex == 1,
              child: FeedbackList(
                userFeedbacks: tutor.user?.feedbacks ?? [],
              ),
            ),
          ],
        )
      ],
    );
  }

  void handleFavorite() {
    setState(() {
      tutor.isFavorite = tutor.isFavorite != null ? !tutor.isFavorite! : false;
    });
  }

  void _handleTabClick(int value) {
    setState(() {
      selectedIndex = value;
      tabController.animateTo(value);
    });
  }
}
