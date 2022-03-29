import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/responses/booking_data_response.dart';
import 'package:leet_tutur/stores/schedule_store/schedule_store.dart';
import 'package:leet_tutur/ui/schedule_page/widgets/upcoming_item.dart';
import 'package:mobx/mobx.dart';

class UpcomingClasses extends StatefulWidget {
  const UpcomingClasses({Key? key}) : super(key: key);

  @override
  State<UpcomingClasses> createState() => _UpcomingClassesState();
}

class _UpcomingClassesState extends State<UpcomingClasses> {
  final _scheduleStore = GetIt.instance.get<ScheduleStore>();
  late BookingDataResponse bookingDataResponse;

  @override
  void initState() {
    _scheduleStore.getBookingsListAsync("0").then((value) => setState(() {
          bookingDataResponse = value.data;
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      var future = _scheduleStore.bookingListResponseFuture;

      var bookInfosGroupByTutorAndDate = _scheduleStore.bookInfosGroupByTutorAndDate;

      return future?.status == FutureStatus.fulfilled
          ? Column(
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
                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    var bookingInfos = bookInfosGroupByTutorAndDate.values.elementAt(index);

                    return UpcomingItem(bookingInfos: bookingInfos);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: bookInfosGroupByTutorAndDate.length,
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
