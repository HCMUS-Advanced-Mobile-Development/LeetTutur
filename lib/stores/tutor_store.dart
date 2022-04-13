import 'package:get_it/get_it.dart';
import 'package:leet_tutur/models/favorite_tutor.dart';
import 'package:leet_tutur/models/row_of_tutor.dart';
import 'package:leet_tutur/models/tutor.dart';
import 'package:leet_tutur/models/requests/tutor_request.dart';
import 'package:leet_tutur/models/responses/tutor_response.dart';
import 'package:leet_tutur/services/tutor_service.dart';
import 'package:mobx/mobx.dart';

part 'tutor_store.g.dart';

class TutorStore = _TutorStore with _$TutorStore;

abstract class _TutorStore with Store {
  final _tutorService = GetIt.instance.get<TutorService>();

  @observable
  ObservableFuture<TutorResponse>? tutorResponseFuture;

  @observable
  ObservableFuture<Tutor>? selectedTutorFuture;

  @computed
  RowOfTutor? get rowOfTutor => tutorResponseFuture?.value?.tutors;

  @computed
  List<FavoriteTutor>? get favoriteTutorList =>
      tutorResponseFuture?.value?.favoriteTutor;

  bool isFavoriteTutor(Tutor tutor) {
    var index = favoriteTutorList
        ?.indexWhere((element) => element.secondId == tutor.userId);
    return favoriteTutorList != null && index != null && index >= 0;
  }

  @action
  Future searchTutors({TutorRequest? request}) async => tutorResponseFuture =
      ObservableFuture(_tutorService.getTutors(request: request));

  @action
  Future getTutorDetail({String id = "0"}) async => selectedTutorFuture =
      ObservableFuture(_tutorService.getTutorDetail(id: id));

  @action
  void unSelectTutor() {
    selectedTutorFuture = null;
  }

  Future addToFavoriteTutorAsync(String? tutorId) async {
    await _tutorService.addToFavoriteTutorAsync(tutorId);
  }
}
