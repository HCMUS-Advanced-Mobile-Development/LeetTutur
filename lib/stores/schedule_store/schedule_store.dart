import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/responses/schedule_response.dart';
import 'package:leet_tutur/services/schedule_service.dart';
import 'package:mobx/mobx.dart';

part 'schedule_store.g.dart';

class ScheduleStore = _ScheduleStore with _$ScheduleStore;

abstract class _ScheduleStore with Store {
  final _scheduleService = GetIt.instance.get<ScheduleService>();

  @observable
  ObservableFuture<ScheduleResponse>? scheduleResponseFuture;

  @action
  Future getScheduleAsync({String id = ""}) async => scheduleResponseFuture =
      ObservableFuture(_scheduleService.getScheduleByTutorId(id: id));
}
