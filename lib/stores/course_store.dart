import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/category.dart';
import 'package:leet_tutur/models/course.dart';
import 'package:leet_tutur/models/requests/base_request.dart';
import 'package:leet_tutur/models/responses/course_category_response.dart';
import 'package:leet_tutur/models/responses/course_response.dart';
import 'package:leet_tutur/services/course_service.dart';
import 'package:leet_tutur/utils/iterable_extensions.dart';
import 'package:mobx/mobx.dart';

part 'course_store.g.dart';

class CourseStore = _CourseStore with _$CourseStore;

abstract class _CourseStore with Store {
  final _courseService = GetIt.instance.get<CourseService>();

  @observable
  String nameQuery = "";

  @observable
  ObservableSet<String> levelQuery = ObservableSet.of([]);

  @observable
  ObservableSet<String> categoryQuery = ObservableSet.of([]);

  @observable
  String orderByLevel = "ASC";

  @observable
  ObservableFuture<CourseCategoryResponse>? courseResponseCategoryFuture;

  @observable
  Course? selectedCourse;

  @observable
  ObservableFuture<CourseResponse>? courseResponseFuture;

  @computed
  List<Course> get filteredCourses {
    var courses = courseResponseFuture?.value?.data?.rows ?? [];
    courses.sort((a, b) {
      if (orderByLevel == "ASC") {
        return a.level?.compareTo(b.level ?? '') ?? 0;
      } else {
        return b.level?.compareTo(a.level ?? '') ?? 0;
      }
    });

    return courses
        .where((element) => element.name?.toLowerCase().contains(nameQuery.toLowerCase()) ?? false || nameQuery.isEmpty)
        .where((element) =>
            levelQuery.contains(element.level) || levelQuery.isEmpty)
        .where((element) =>
            categoryQuery.contains(element.categories?.first.key) ||
            categoryQuery.isEmpty)
        .toList();
  }

  @computed
  Map<String, List<Course>> get coursesByLevel {
    var courses = filteredCourses;

    return courses.groupBy((c) => c.categories?[0].key ?? "");
  }

  @computed
  Map<String, String> get courseLevelMap {
    var courses = courseResponseFuture?.value?.data?.rows ?? [];
    return courses.fold(
        <String, String>{},
        (previousValue, element) => previousValue
          ..putIfAbsent(element.level ?? "0", () => element.getLevelName()));
  }

  @computed
  Map<String, String> get categoryMap => {
        for (var c in courseResponseCategoryFuture?.value?.rows ?? [])
          c.key: c.title
      };

  @action
  Future<CourseResponse> getCoursesAsync({BaseRequest? request}) async =>
      courseResponseFuture =
          ObservableFuture(_courseService.getCourseAsync(request: request));

  @action
  Future<CourseCategoryResponse> getCourseCategoriesAsync() async =>
      courseResponseCategoryFuture =
          ObservableFuture(_courseService.getCourseCategoriesAsync());
}
