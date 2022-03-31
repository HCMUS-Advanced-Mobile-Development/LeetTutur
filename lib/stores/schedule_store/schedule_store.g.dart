// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleStore on _ScheduleStore, Store {
  Computed<Map<String, List<BookingInfo>>>?
      _$bookInfosGroupByTutorAndDateComputed;

  @override
  Map<String, List<BookingInfo>> get bookInfosGroupByTutorAndDate =>
      (_$bookInfosGroupByTutorAndDateComputed ??=
              Computed<Map<String, List<BookingInfo>>>(
                  () => super.bookInfosGroupByTutorAndDate,
                  name: '_ScheduleStore.bookInfosGroupByTutorAndDate'))
          .value;

  final _$scheduleResponseFutureAtom =
      Atom(name: '_ScheduleStore.scheduleResponseFuture');

  @override
  ObservableFuture<ScheduleResponse>? get scheduleResponseFuture {
    _$scheduleResponseFutureAtom.reportRead();
    return super.scheduleResponseFuture;
  }

  @override
  set scheduleResponseFuture(ObservableFuture<ScheduleResponse>? value) {
    _$scheduleResponseFutureAtom
        .reportWrite(value, super.scheduleResponseFuture, () {
      super.scheduleResponseFuture = value;
    });
  }

  final _$bookingListResponseFutureAtom =
      Atom(name: '_ScheduleStore.bookingListResponseFuture');

  @override
  ObservableFuture<BookingListResponse>? get bookingListResponseFuture {
    _$bookingListResponseFutureAtom.reportRead();
    return super.bookingListResponseFuture;
  }

  @override
  set bookingListResponseFuture(ObservableFuture<BookingListResponse>? value) {
    _$bookingListResponseFutureAtom
        .reportWrite(value, super.bookingListResponseFuture, () {
      super.bookingListResponseFuture = value;
    });
  }

  final _$totalLearnedHoursFutureAtom =
      Atom(name: '_ScheduleStore.totalLearnedHoursFuture');

  @override
  ObservableFuture<Duration>? get totalLearnedHoursFuture {
    _$totalLearnedHoursFutureAtom.reportRead();
    return super.totalLearnedHoursFuture;
  }

  @override
  set totalLearnedHoursFuture(ObservableFuture<Duration>? value) {
    _$totalLearnedHoursFutureAtom
        .reportWrite(value, super.totalLearnedHoursFuture, () {
      super.totalLearnedHoursFuture = value;
    });
  }

  final _$learnHistoryFutureAtom =
      Atom(name: '_ScheduleStore.learnHistoryFuture');

  @override
  ObservableFuture<BookingListResponse>? get learnHistoryFuture {
    _$learnHistoryFutureAtom.reportRead();
    return super.learnHistoryFuture;
  }

  @override
  set learnHistoryFuture(ObservableFuture<BookingListResponse>? value) {
    _$learnHistoryFutureAtom.reportWrite(value, super.learnHistoryFuture, () {
      super.learnHistoryFuture = value;
    });
  }

  final _$getScheduleAsyncAsyncAction =
      AsyncAction('_ScheduleStore.getScheduleAsync');

  @override
  Future<dynamic> getScheduleAsync({String id = ""}) {
    return _$getScheduleAsyncAsyncAction
        .run(() => super.getScheduleAsync(id: id));
  }

  final _$getBookingsListAsyncAsyncAction =
      AsyncAction('_ScheduleStore.getBookingsListAsync');

  @override
  Future<dynamic> getBookingsListAsync(String tutorId,
      {BookingListRequest? request}) {
    return _$getBookingsListAsyncAsyncAction
        .run(() => super.getBookingsListAsync(tutorId, request: request));
  }

  final _$getTotalLearnedHoursAsyncAsyncAction =
      AsyncAction('_ScheduleStore.getTotalLearnedHoursAsync');

  @override
  Future<dynamic> getTotalLearnedHoursAsync() {
    return _$getTotalLearnedHoursAsyncAsyncAction
        .run(() => super.getTotalLearnedHoursAsync());
  }

  final _$getLearnHistoryAsyncAsyncAction =
      AsyncAction('_ScheduleStore.getLearnHistoryAsync');

  @override
  Future<dynamic> getLearnHistoryAsync(
      {BookingListRequest? bookingListRequest}) {
    return _$getLearnHistoryAsyncAsyncAction.run(() =>
        super.getLearnHistoryAsync(bookingListRequest: bookingListRequest));
  }

  @override
  String toString() {
    return '''
scheduleResponseFuture: ${scheduleResponseFuture},
bookingListResponseFuture: ${bookingListResponseFuture},
totalLearnedHoursFuture: ${totalLearnedHoursFuture},
learnHistoryFuture: ${learnHistoryFuture},
bookInfosGroupByTutorAndDate: ${bookInfosGroupByTutorAndDate}
    ''';
  }
}
