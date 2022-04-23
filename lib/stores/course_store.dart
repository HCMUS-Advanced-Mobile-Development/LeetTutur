import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/course.dart';
import 'package:leet_tutur/models/requests/base_request.dart';
import 'package:leet_tutur/models/responses/course_response.dart';
import 'package:leet_tutur/services/course_service.dart';
import 'package:mobx/mobx.dart';

part 'course_store.g.dart';

class CourseStore = _CourseStore with _$CourseStore;

abstract class _CourseStore with Store {
  final _courseService = GetIt.instance.get<CourseService>();

  @observable
  Course? selectedCourse;

  @observable
  ObservableFuture<CourseResponse>? courseResponseFuture;

  @action
  Future<CourseResponse> getCoursesAsync({BaseRequest? request}) async => courseResponseFuture =
      ObservableFuture(_courseService.getCourseAsync(request: request));
}
