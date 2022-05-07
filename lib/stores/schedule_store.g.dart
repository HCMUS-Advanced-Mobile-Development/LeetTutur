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

  late final _$scheduleResponseFutureAtom =
      Atom(name: '_ScheduleStore.scheduleResponseFuture', context: context);

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

  late final _$bookingListResponseFutureAtom =
      Atom(name: '_ScheduleStore.bookingListResponseFuture', context: context);

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

  late final _$totalLearnedHoursFutureAtom =
      Atom(name: '_ScheduleStore.totalLearnedHoursFuture', context: context);

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

  late final _$learnHistoryFutureAtom =
      Atom(name: '_ScheduleStore.learnHistoryFuture', context: context);

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

  late final _$selectedClassAtom =
      Atom(name: '_ScheduleStore.selectedClass', context: context);

  @override
  BookingInfo? get selectedClass {
    _$selectedClassAtom.reportRead();
    return super.selectedClass;
  }

  @override
  set selectedClass(BookingInfo? value) {
    _$selectedClassAtom.reportWrite(value, super.selectedClass, () {
      super.selectedClass = value;
    });
  }

  late final _$getScheduleByTutorIdAsyncAsyncAction =
      AsyncAction('_ScheduleStore.getScheduleByTutorIdAsync', context: context);

  @override
  Future<dynamic> getScheduleByTutorIdAsync({String id = ""}) {
    return _$getScheduleByTutorIdAsyncAsyncAction
        .run(() => super.getScheduleByTutorIdAsync(id: id));
  }

  late final _$getBookingsListAsyncAsyncAction =
      AsyncAction('_ScheduleStore.getBookingsListAsync', context: context);

  @override
  Future<BookingListResponse> getBookingsListAsync(
      {BookingListRequest? request}) {
    return _$getBookingsListAsyncAsyncAction
        .run(() => super.getBookingsListAsync(request: request));
  }

  late final _$getTotalLearnedHoursAsyncAsyncAction =
      AsyncAction('_ScheduleStore.getTotalLearnedHoursAsync', context: context);

  @override
  Future<dynamic> getTotalLearnedHoursAsync() {
    return _$getTotalLearnedHoursAsyncAsyncAction
        .run(() => super.getTotalLearnedHoursAsync());
  }

  late final _$getLearnHistoryAsyncAsyncAction =
      AsyncAction('_ScheduleStore.getLearnHistoryAsync', context: context);

  @override
  Future<BookingListResponse> getLearnHistoryAsync(
      {BookingListRequest? request}) {
    return _$getLearnHistoryAsyncAsyncAction
        .run(() => super.getLearnHistoryAsync(request: request));
  }

  late final _$bookAsyncAsyncAction =
      AsyncAction('_ScheduleStore.bookAsync', context: context);

  @override
  Future<BookResponse> bookAsync({BookRequest? request}) {
    return _$bookAsyncAsyncAction.run(() => super.bookAsync(request: request));
  }

  late final _$cancelClassAsyncAsyncAction =
      AsyncAction('_ScheduleStore.cancelClassAsync', context: context);

  @override
  Future<dynamic> cancelClassAsync({List<String>? scheduleDetailIds}) {
    return _$cancelClassAsyncAsyncAction.run(
        () => super.cancelClassAsync(scheduleDetailIds: scheduleDetailIds));
  }

  @override
  String toString() {
    return '''
scheduleResponseFuture: ${scheduleResponseFuture},
bookingListResponseFuture: ${bookingListResponseFuture},
totalLearnedHoursFuture: ${totalLearnedHoursFuture},
learnHistoryFuture: ${learnHistoryFuture},
selectedClass: ${selectedClass},
bookInfosGroupByTutorAndDate: ${bookInfosGroupByTutorAndDate}
    ''';
  }
}
