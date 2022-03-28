import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/responses/schedule_response.dart';
import 'package:leet_tutur/stores/schedule_store/schedule_store.dart';
import 'package:leet_tutur/ui/tutor_detail/widgets/schedule_item.dart';
import 'package:mobx/mobx.dart';

class ScheduleList extends StatefulWidget {
  const ScheduleList({Key? key}) : super(key: key);

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  final scheduleStore = GetIt.instance.get<ScheduleStore>();
  late final ScheduleResponse scheduleResponse;

  @override
  void initState() {
    scheduleStore.getScheduleAsync().then((value) {
      setState(() => scheduleResponse = value);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      var future = scheduleStore.scheduleResponseFuture;

      return future?.status == FutureStatus.fulfilled
          ? ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemCount: scheduleResponse.data?.length ?? 0,
              itemBuilder: (context, index) {
                var schedule = scheduleResponse.data![index];
                return ScheduleItem(schedule: schedule);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            )
          : const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            );
    });
  }
}
