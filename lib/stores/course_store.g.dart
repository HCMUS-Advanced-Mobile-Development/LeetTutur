// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CourseStore on _CourseStore, Store {
  Computed<List<Course>>? _$filteredCoursesComputed;

  @override
  List<Course> get filteredCourses => (_$filteredCoursesComputed ??=
          Computed<List<Course>>(() => super.filteredCourses,
              name: '_CourseStore.filteredCourses'))
      .value;
  Computed<Map<String, List<Course>>>? _$coursesByLevelComputed;

  @override
  Map<String, List<Course>> get coursesByLevel => (_$coursesByLevelComputed ??=
          Computed<Map<String, List<Course>>>(() => super.coursesByLevel,
              name: '_CourseStore.coursesByLevel'))
      .value;
  Computed<Map<String, String>>? _$courseLevelMapComputed;

  @override
  Map<String, String> get courseLevelMap => (_$courseLevelMapComputed ??=
          Computed<Map<String, String>>(() => super.courseLevelMap,
              name: '_CourseStore.courseLevelMap'))
      .value;
  Computed<Map<String, String>>? _$categoryMapComputed;

  @override
  Map<String, String> get categoryMap => (_$categoryMapComputed ??=
          Computed<Map<String, String>>(() => super.categoryMap,
              name: '_CourseStore.categoryMap'))
      .value;

  final _$nameQueryAtom = Atom(name: '_CourseStore.nameQuery');

  @override
  String get nameQuery {
    _$nameQueryAtom.reportRead();
    return super.nameQuery;
  }

  @override
  set nameQuery(String value) {
    _$nameQueryAtom.reportWrite(value, super.nameQuery, () {
      super.nameQuery = value;
    });
  }

  final _$levelQueryAtom = Atom(name: '_CourseStore.levelQuery');

  @override
  ObservableSet<String> get levelQuery {
    _$levelQueryAtom.reportRead();
    return super.levelQuery;
  }

  @override
  set levelQuery(ObservableSet<String> value) {
    _$levelQueryAtom.reportWrite(value, super.levelQuery, () {
      super.levelQuery = value;
    });
  }

  final _$categoryQueryAtom = Atom(name: '_CourseStore.categoryQuery');

  @override
  ObservableSet<String> get categoryQuery {
    _$categoryQueryAtom.reportRead();
    return super.categoryQuery;
  }

  @override
  set categoryQuery(ObservableSet<String> value) {
    _$categoryQueryAtom.reportWrite(value, super.categoryQuery, () {
      super.categoryQuery = value;
    });
  }

  final _$orderByLevelAtom = Atom(name: '_CourseStore.orderByLevel');

  @override
  String get orderByLevel {
    _$orderByLevelAtom.reportRead();
    return super.orderByLevel;
  }

  @override
  set orderByLevel(String value) {
    _$orderByLevelAtom.reportWrite(value, super.orderByLevel, () {
      super.orderByLevel = value;
    });
  }

  final _$courseResponseCategoryFutureAtom =
      Atom(name: '_CourseStore.courseResponseCategoryFuture');

  @override
  ObservableFuture<CourseCategoryResponse>? get courseResponseCategoryFuture {
    _$courseResponseCategoryFutureAtom.reportRead();
    return super.courseResponseCategoryFuture;
  }

  @override
  set courseResponseCategoryFuture(
      ObservableFuture<CourseCategoryResponse>? value) {
    _$courseResponseCategoryFutureAtom
        .reportWrite(value, super.courseResponseCategoryFuture, () {
      super.courseResponseCategoryFuture = value;
    });
  }

  final _$selectedCourseAtom = Atom(name: '_CourseStore.selectedCourse');

  @override
  Course? get selectedCourse {
    _$selectedCourseAtom.reportRead();
    return super.selectedCourse;
  }

  @override
  set selectedCourse(Course? value) {
    _$selectedCourseAtom.reportWrite(value, super.selectedCourse, () {
      super.selectedCourse = value;
    });
  }

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
  Future<CourseResponse> getCoursesAsync({BaseRequest? request}) {
    return _$getCoursesAsyncAsyncAction
        .run(() => super.getCoursesAsync(request: request));
  }

  final _$getCourseCategoriesAsyncAsyncAction =
      AsyncAction('_CourseStore.getCourseCategoriesAsync');

  @override
  Future<CourseCategoryResponse> getCourseCategoriesAsync() {
    return _$getCourseCategoriesAsyncAsyncAction
        .run(() => super.getCourseCategoriesAsync());
  }

  @override
  String toString() {
    return '''
nameQuery: ${nameQuery},
levelQuery: ${levelQuery},
categoryQuery: ${categoryQuery},
orderByLevel: ${orderByLevel},
courseResponseCategoryFuture: ${courseResponseCategoryFuture},
selectedCourse: ${selectedCourse},
courseResponseFuture: ${courseResponseFuture},
filteredCourses: ${filteredCourses},
coursesByLevel: ${coursesByLevel},
courseLevelMap: ${courseLevelMap},
categoryMap: ${categoryMap}
    ''';
  }
}
