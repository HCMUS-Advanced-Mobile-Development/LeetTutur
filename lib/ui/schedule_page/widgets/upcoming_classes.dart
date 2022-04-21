import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/booking_info.dart';
import 'package:leet_tutur/models/requests/booking_list_request.dart';
import 'package:leet_tutur/stores/schedule_store.dart';
import 'package:leet_tutur/ui/schedule_page/widgets/upcoming_item.dart';
import 'package:leet_tutur/widgets/empty_page.dart';
import 'package:leet_tutur/widgets/error_page.dart';

class UpcomingClasses extends StatefulWidget {
  const UpcomingClasses({Key? key}) : super(key: key);

  @override
  State<UpcomingClasses> createState() => _UpcomingClassesState();
}

class _UpcomingClassesState extends State<UpcomingClasses> {
  final _scheduleStore = GetIt.instance.get<ScheduleStore>();

  final _pagingController = PagingController<int, List<BookingInfo>>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    _setUpListPaging();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          S.current.upcomingClasses,
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              _pagingController.refresh();
            },
            child: PagedListView.separated(
              pagingController: _pagingController,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox.shrink();
              },
              builderDelegate: PagedChildBuilderDelegate<List<BookingInfo>>(
                itemBuilder: (context, bookingInfos, index) {
                  return UpcomingItem(bookingInfos: bookingInfos);
                },
                firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: CircularProgressIndicator()),
                firstPageErrorIndicatorBuilder: (context) => const ErrorPage(),
                noItemsFoundIndicatorBuilder: (context) => const EmptyPage(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _setUpListPaging() {
    var _previouslyFetchedItemsCount = 0;

    _pagingController.addPageRequestListener(
      (pageKey) async {
        try {
          var bookingListResponse = await _scheduleStore.getBookingsListAsync(
            request: BookingListRequest(
              dateTimeGte: DateTime.now().millisecondsSinceEpoch,
            )..page = pageKey,
          );

          final fetchedItemsCount = bookingListResponse.data?.rows?.length ?? 0;
          final totalCount = bookingListResponse.data?.count ?? 0;

          final isLastPage =
              _previouslyFetchedItemsCount + fetchedItemsCount == totalCount;

          var items =
              _scheduleStore.bookInfosGroupByTutorAndDate.values.toList();
          if (isLastPage) {
            _pagingController.appendLastPage(items);
          } else {
            _pagingController.appendPage(items, pageKey + 1);
          }

          _previouslyFetchedItemsCount += fetchedItemsCount;
        } catch (e) {
          _pagingController.error = e;
        }
      },
    );
  }
}
