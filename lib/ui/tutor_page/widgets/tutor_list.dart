import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:leet_tutur/models/requests/tutor_request.dart';
import 'package:leet_tutur/models/tutor.dart';
import 'package:leet_tutur/models/tutor_filter.dart';
import 'package:leet_tutur/stores/tutor_store.dart';
import 'package:leet_tutur/ui/tutor_page/widgets/tutor_card.dart';
import 'package:leet_tutur/widgets/empty_page.dart';
import 'package:leet_tutur/widgets/error_page.dart';
import 'package:mobx/mobx.dart';

class TutorList extends StatefulWidget {
  const TutorList({Key? key}) : super(key: key);

  @override
  State<TutorList> createState() => _TutorListState();
}

class _TutorListState extends State<TutorList> {
  final _tutorStore = GetIt.instance.get<TutorStore>();

  final _pagingController = PagingController<int, Tutor>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    _tutorStore.getTutorSpecialtiesAsync();
    _tutorStore.getTutorCountryAsync();

    setUpListPaging();

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (BuildContext context) {
        // Tutor specialties can be modified else where (SpecialtyList)
        // Need to refresh our list
        return reaction((_) => _tutorStore.selectedSpecialty, (value) {
          _pagingController.refresh();
        });
      },
      child: RefreshIndicator(
        onRefresh: () async {
          _pagingController.refresh();
        },
        child: PagedListView.separated(
          pagingController: _pagingController,
          separatorBuilder: (context, index) => const SizedBox.shrink(),
          builderDelegate: PagedChildBuilderDelegate<Tutor>(
            itemBuilder: (context, tutor, index) {
              return TutorCard(tutor: tutor);
            },
            firstPageProgressIndicatorBuilder: (context) =>
                const Center(child: CircularProgressIndicator()),
            firstPageErrorIndicatorBuilder: (context) => const ErrorPage(),
            noItemsFoundIndicatorBuilder: (context) => const EmptyPage(),
          ),
        ),
      ),
    );
  }

  void setUpListPaging() {
    _pagingController.addPageRequestListener(
      (pageKey) async {
        try {
          var tutorRes = await _tutorStore.searchTutorsAsync(
            request: TutorRequest(
              filters: TutorFilter(
                specialties: [_tutorStore.selectedSpecialty],
              ),
            )..page = pageKey,
          );

          final previouslyFetchedItemsCount =
              _pagingController.itemList?.length ?? 0;
          final fetchedTutorsCount = tutorRes.tutors?.rows?.length ?? 0;
          final totalTutor = tutorRes.tutors?.count ?? 0;

          final isLastPage =
              previouslyFetchedItemsCount + fetchedTutorsCount == totalTutor;
          if (isLastPage) {
            _pagingController.appendLastPage(tutorRes.tutors?.rows ?? []);
          } else {
            _pagingController.appendPage(
                tutorRes.tutors?.rows ?? [], pageKey + 1);
          }
        } catch (e) {
          _pagingController.error = e;
        }
      },
    );
  }
}
