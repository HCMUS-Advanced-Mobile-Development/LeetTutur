import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/models/booking_info.dart';
import 'package:leet_tutur/models/requests/booking_list_request.dart';
import 'package:leet_tutur/stores/schedule_store.dart';
import 'package:leet_tutur/ui/learn_history/widgets/learn_history_item.dart';
import 'package:leet_tutur/widgets/empty_page.dart';
import 'package:leet_tutur/widgets/error_page.dart';
import 'package:mobx/mobx.dart';
import 'package:recase/recase.dart';

class LearnHistory extends StatefulWidget {
  const LearnHistory({Key? key}) : super(key: key);

  @override
  State<LearnHistory> createState() => _LearnHistoryState();
}

class _LearnHistoryState extends State<LearnHistory> {
  final _scheduleStore = GetIt.instance.get<ScheduleStore>();

  final _pagingController = PagingController<int, BookingInfo>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    _scheduleStore.getLearnHistoryAsync();
    _pagingController.addPageRequestListener(_pageRequestListener);
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RouteConstants.learnHistory.titleCase),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _pagingController.refresh();
        },
        child: PagedListView.separated(
          pagingController: _pagingController,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox.shrink();
          },
          builderDelegate: PagedChildBuilderDelegate<BookingInfo>(
            itemBuilder: (context, bookingInfo, index) {
              return LearnHistoryItem(bookingInfo: bookingInfo);
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

  void _pageRequestListener(int pageKey) async {
    try {
      var bookingListResponse = await _scheduleStore.getLearnHistoryAsync(
        request: BookingListRequest(
          dateTimeLte: DateTime.now().millisecondsSinceEpoch,
        )
          ..page = pageKey
          ..perPage = 12,
      );

      final previouslyFetchedItemsCount =
          _pagingController.itemList?.length ?? 0;
      final fetchedItemsCount = bookingListResponse.data?.rows?.length ?? 0;
      final totalCount = bookingListResponse.data?.count ?? 0;

      final isLastPage =
          previouslyFetchedItemsCount + fetchedItemsCount == totalCount;

      var items = bookingListResponse.data?.rows ?? [];

      if (isLastPage) {
        _pagingController.appendLastPage(items);
      } else {
        _pagingController.appendPage(items, pageKey + 1);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }
}
