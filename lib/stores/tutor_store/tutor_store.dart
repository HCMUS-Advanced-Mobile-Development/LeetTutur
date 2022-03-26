import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/favorite_tutor.dart';
import 'package:leet_tutur/models/row_of_tutor.dart';
import 'package:leet_tutur/models/tutor.dart';
import 'package:leet_tutur/models/tutor_request.dart';
import 'package:leet_tutur/models/tutor_response.dart';
import 'package:leet_tutur/services/tutor_service.dart';
import 'package:mobx/mobx.dart';

part 'tutor_store.g.dart';

class TutorStore = _TutorStore with _$TutorStore;

abstract class _TutorStore with Store {
  final _tutorService = GetIt.instance.get<TutorService>();

  @observable
  ObservableFuture<TutorResponse>? tutorResponse;

  @computed
  RowOfTutor? get rowOfTutor => tutorResponse?.value?.tutors;

  @computed
  List<FavoriteTutor>? get favoriteTutorList =>
      tutorResponse?.value?.favoriteTutor;

  bool isFavoriteTutor(Tutor tutor) {
    var index = favoriteTutorList
        ?.indexWhere((element) => element.secondId == tutor.userId);
    return favoriteTutorList != null && index != null && index > 0;
  }

  @action
  Future searchTutors({TutorRequest? request}) async => tutorResponse =
      ObservableFuture(_tutorService.getTutors(request: request));
}
