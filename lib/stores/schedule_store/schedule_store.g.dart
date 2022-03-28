// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScheduleStore on _ScheduleStore, Store {
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

  final _$getScheduleAsyncAsyncAction =
      AsyncAction('_ScheduleStore.getScheduleAsync');

  @override
  Future<dynamic> getScheduleAsync({String id = ""}) {
    return _$getScheduleAsyncAsyncAction
        .run(() => super.getScheduleAsync(id: id));
  }

  @override
  String toString() {
    return '''
scheduleResponseFuture: ${scheduleResponseFuture}
    ''';
  }
}
