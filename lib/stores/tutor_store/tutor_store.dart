import 'package:leet_tutur/models/favorite_tutor.dart';
import 'package:leet_tutur/models/row_of_tutor.dart';
import 'package:leet_tutur/models/tutor_response.dart';
import 'package:mobx/mobx.dart';

part 'tutor_store.g.dart';

class TutorStore = _TutorStore with _$TutorStore;

abstract class _TutorStore with Store {
  @observable
  ObservableFuture<TutorResponse>? tutorResponse;

  @computed
  RowOfTutor? get rowOfTutor => tutorResponse?.value?.tutors;

  @computed
  List<FavoriteTutor>? get favoriteTutorList => tutorResponse?.value?.favoriteTutor;
}