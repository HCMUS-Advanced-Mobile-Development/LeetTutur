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

  @override
  String toString() {
    return '''
scheduleResponseFuture: ${scheduleResponseFuture},
bookingListResponseFuture: ${bookingListResponseFuture},
bookInfosGroupByTutorAndDate: ${bookInfosGroupByTutorAndDate}
    ''';
  }
}
