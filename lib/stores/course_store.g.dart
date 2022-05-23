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

  late final _$nameQueryAtom =
      Atom(name: '_CourseStore.nameQuery', context: context);

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

  late final _$levelQueryAtom =
      Atom(name: '_CourseStore.levelQuery', context: context);

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

  late final _$categoryQueryAtom =
      Atom(name: '_CourseStore.categoryQuery', context: context);

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

  late final _$orderByLevelAtom =
      Atom(name: '_CourseStore.orderByLevel', context: context);

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

  late final _$courseResponseCategoryFutureAtom =
      Atom(name: '_CourseStore.courseResponseCategoryFuture', context: context);

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

  late final _$selectedCourseAtom =
      Atom(name: '_CourseStore.selectedCourse', context: context);

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

  late final _$selectedTopicAtom =
      Atom(name: '_CourseStore.selectedTopic', context: context);

  @override
  Topic? get selectedTopic {
    _$selectedTopicAtom.reportRead();
    return super.selectedTopic;
  }

  @override
  set selectedTopic(Topic? value) {
    _$selectedTopicAtom.reportWrite(value, super.selectedTopic, () {
      super.selectedTopic = value;
    });
  }

  late final _$courseResponseFutureAtom =
      Atom(name: '_CourseStore.courseResponseFuture', context: context);

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

  late final _$getCoursesAsyncAsyncAction =
      AsyncAction('_CourseStore.getCoursesAsync', context: context);

  @override
  Future<CourseResponse> getCoursesAsync({BaseRequest? request}) {
    return _$getCoursesAsyncAsyncAction
        .run(() => super.getCoursesAsync(request: request));
  }

  late final _$getCourseCategoriesAsyncAsyncAction =
      AsyncAction('_CourseStore.getCourseCategoriesAsync', context: context);

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
selectedTopic: ${selectedTopic},
courseResponseFuture: ${courseResponseFuture},
filteredCourses: ${filteredCourses},
coursesByLevel: ${coursesByLevel},
courseLevelMap: ${courseLevelMap},
categoryMap: ${categoryMap}
    ''';
  }
}
