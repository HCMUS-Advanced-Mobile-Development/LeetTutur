import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/booking_info.dart';
import 'package:leet_tutur/models/requests/book_request.dart';
import 'package:leet_tutur/models/requests/booking_list_request.dart';
import 'package:leet_tutur/models/responses/book_response.dart';
import 'package:leet_tutur/models/responses/booking_list_response.dart';
import 'package:leet_tutur/models/responses/schedule_response.dart';
import 'package:leet_tutur/services/schedule_service.dart';
import 'package:leet_tutur/utils/date_time_utils.dart';
import 'package:leet_tutur/utils/iterable_extensions.dart';
import 'package:mobx/mobx.dart';

part 'schedule_store.g.dart';

class ScheduleStore = _ScheduleStore with _$ScheduleStore;

abstract class _ScheduleStore with Store {
  final _scheduleService = GetIt.instance.get<ScheduleService>();

  @observable
  ObservableFuture<ScheduleResponse>? scheduleResponseFuture;

  @observable
  ObservableFuture<BookingListResponse>? bookingListResponseFuture;

  @observable
  ObservableFuture<Duration>? totalLearnedHoursFuture;

  @observable
  ObservableFuture<BookingListResponse>? learnHistoryFuture;

  @observable
  BookingInfo? selectedClass;

  @computed
  Map<String, List<BookingInfo>> get bookInfosGroupByTutorAndDate =>
      bookingListResponseFuture?.value?.data?.rows?.groupBy((e) {
        var bookedDate = DateTimeUtils.formatDate(
            DateTime.fromMillisecondsSinceEpoch(
                e.scheduleDetailInfo?.startPeriodTimestamp ?? 0));

        var tutorName =
            e.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.name ?? "";

        return "$bookedDate - $tutorName";
      }) ??
      {};

  @action
  Future getScheduleByTutorIdAsync({String id = ""}) async => scheduleResponseFuture =
      ObservableFuture(_scheduleService.getScheduleByTutorIdAsync(id: id));

  @action
  Future<BookingListResponse> getBookingsListAsync({BookingListRequest? request}) async =>
      bookingListResponseFuture = ObservableFuture(
          _scheduleService.getBookingsListAsync(request: request));

  @action
  Future getTotalLearnedHoursAsync() async => totalLearnedHoursFuture =
      ObservableFuture(_scheduleService.getTotalLearnedHoursAsync());

  @action
  Future<BookingListResponse> getLearnHistoryAsync({BookingListRequest? request}) async =>
      learnHistoryFuture = ObservableFuture(_scheduleService
          .getLearnHistoryAsync(request: request));

  @action
  Future<BookResponse> bookAsync({BookRequest? request}) async {
    var response = await _scheduleService.bookAsync(request: request);

    return response;
  }
}
