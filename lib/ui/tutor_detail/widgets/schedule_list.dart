import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/responses/schedule_response.dart';
import 'package:leet_tutur/stores/schedule_store.dart';
import 'package:leet_tutur/stores/tutor_store.dart';
import 'package:leet_tutur/ui/tutor_detail/widgets/schedule_item.dart';
import 'package:leet_tutur/widgets/empty_page.dart';
import 'package:leet_tutur/widgets/error_page.dart';
import 'package:mobx/mobx.dart';

class ScheduleList extends StatefulWidget {
  const ScheduleList({Key? key}) : super(key: key);

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  final _tutorStore = GetIt.instance.get<TutorStore>();
  final _scheduleStore = GetIt.instance.get<ScheduleStore>();

  late final ScheduleResponse _scheduleResponse;

  @override
  void initState() {
    _scheduleStore
        .getScheduleByTutorIdAsync(id: _tutorStore.selectedTutorId)
        .then((value) {
      setState(() => _scheduleResponse = value);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      var future = _scheduleStore.scheduleResponseFuture;

      switch (future?.status) {
        case FutureStatus.fulfilled:
          return (future?.value?.data?.length ?? 0) > 0 ? ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: _scheduleResponse.data?.length ?? 0,
            itemBuilder: (context, index) {
              var schedule = _scheduleResponse.data![index];
              return ScheduleItem(schedule: schedule);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          ) : const EmptyPage();
        case FutureStatus.rejected:
          return const ErrorPage();
        default:
          return const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
          );
      }
    });
  }
}
