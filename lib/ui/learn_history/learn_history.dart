import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leet_tutur/constants/route_constants.dart';
import 'package:leet_tutur/stores/schedule_store/schedule_store.dart';
import 'package:leet_tutur/ui/learn_history/widgets/learn_history_item.dart';
import 'package:mobx/mobx.dart';
import 'package:recase/recase.dart';

class LearnHistory extends StatefulWidget {
  const LearnHistory({Key? key}) : super(key: key);

  @override
  State<LearnHistory> createState() => _LearnHistoryState();
}

class _LearnHistoryState extends State<LearnHistory> {
  final _scheduleStore = GetIt.instance.get<ScheduleStore>();

  @override
  void initState() {
    _scheduleStore.getLearnHistoryAsync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RouteConstants.learnHistory.titleCase),
      ),
      body: Observer(builder: (context) {
        return _scheduleStore.learnHistoryFuture?.status ==
                FutureStatus.fulfilled
            ? ListView.separated(
                itemBuilder: (context, index) {
                  var bookingInfo = _scheduleStore
                      .learnHistoryFuture?.value?.data?.rows?[index];
                  return LearnHistoryItem(bookingInfo: bookingInfo!);
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: _scheduleStore
                        .learnHistoryFuture?.value?.data?.rows?.length ??
                    0,
              )
            : const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
