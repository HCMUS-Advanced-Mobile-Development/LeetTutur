// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CourseStore on _CourseStore, Store {
  final _$courseResponseFutureAtom =
      Atom(name: '_CourseStore.courseResponseFuture');

  @override
  ObservableFuture<CourseResponse>? get courseResponseFuture {
    _$courseResponseFutureAtom.reportRead();
    return super.courseResponseFuture;
  }

  @override
  set courseResponseFuture(ObservableFuture<CourseResponse>? value) {
    _$courseResponseFutureAtom.reportWrite(value, super.courseResponseFuture,
        () {
      super.courseResponseFuture = value;
    });
  }

  final _$getCoursesAsyncAsyncAction =
      AsyncAction('_CourseStore.getCoursesAsync');

  @override
  Future<dynamic> getCoursesAsync({BaseRequest? request}) {
    return _$getCoursesAsyncAsyncAction
        .run(() => super.getCoursesAsync(request: request));
  }

  @override
  String toString() {
    return '''
courseResponseFuture: ${courseResponseFuture}
    ''';
  }
}
