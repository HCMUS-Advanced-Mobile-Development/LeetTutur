// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TutorStore on _TutorStore, Store {
  Computed<RowOfTutor?>? _$rowOfTutorComputed;

  @override
  RowOfTutor? get rowOfTutor =>
      (_$rowOfTutorComputed ??= Computed<RowOfTutor?>(() => super.rowOfTutor,
              name: '_TutorStore.rowOfTutor'))
          .value;
  Computed<List<FavoriteTutor>?>? _$favoriteTutorListComputed;

  @override
  List<FavoriteTutor>? get favoriteTutorList => (_$favoriteTutorListComputed ??=
          Computed<List<FavoriteTutor>?>(() => super.favoriteTutorList,
              name: '_TutorStore.favoriteTutorList'))
      .value;

  final _$tutorResponseFutureAtom =
      Atom(name: '_TutorStore.tutorResponseFuture');

  @override
  ObservableFuture<TutorResponse>? get tutorResponseFuture {
    _$tutorResponseFutureAtom.reportRead();
    return super.tutorResponseFuture;
  }

  @override
  set tutorResponseFuture(ObservableFuture<TutorResponse>? value) {
    _$tutorResponseFutureAtom.reportWrite(value, super.tutorResponseFuture, () {
      super.tutorResponseFuture = value;
    });
  }

  final _$selectedTutorIdAtom = Atom(name: '_TutorStore.selectedTutorId');

  @override
  String get selectedTutorId {
    _$selectedTutorIdAtom.reportRead();
    return super.selectedTutorId;
  }

  @override
  set selectedTutorId(String value) {
    _$selectedTutorIdAtom.reportWrite(value, super.selectedTutorId, () {
      super.selectedTutorId = value;
    });
  }

  final _$tutorDetailFutureAtom = Atom(name: '_TutorStore.tutorDetailFuture');

  @override
  ObservableFuture<Tutor>? get tutorDetailFuture {
    _$tutorDetailFutureAtom.reportRead();
    return super.tutorDetailFuture;
  }

  @override
  set tutorDetailFuture(ObservableFuture<Tutor>? value) {
    _$tutorDetailFutureAtom.reportWrite(value, super.tutorDetailFuture, () {
      super.tutorDetailFuture = value;
    });
  }

  final _$tutorSpecialtiesAtom = Atom(name: '_TutorStore.tutorSpecialties');

  @override
  ObservableMap<String, String> get tutorSpecialties {
    _$tutorSpecialtiesAtom.reportRead();
    return super.tutorSpecialties;
  }

  @override
  set tutorSpecialties(ObservableMap<String, String> value) {
    _$tutorSpecialtiesAtom.reportWrite(value, super.tutorSpecialties, () {
      super.tutorSpecialties = value;
    });
  }

  final _$selectedSpecialtyAtom = Atom(name: '_TutorStore.selectedSpecialty');

  @override
  String get selectedSpecialty {
    _$selectedSpecialtyAtom.reportRead();
    return super.selectedSpecialty;
  }

  @override
  set selectedSpecialty(String value) {
    _$selectedSpecialtyAtom.reportWrite(value, super.selectedSpecialty, () {
      super.selectedSpecialty = value;
    });
  }

  final _$searchTutorsAsyncAction = AsyncAction('_TutorStore.searchTutors');

  @override
  Future<TutorResponse> searchTutors({TutorRequest? request}) {
    return _$searchTutorsAsyncAction
        .run(() => super.searchTutors(request: request));
  }

  final _$getTutorDetailAsyncAction = AsyncAction('_TutorStore.getTutorDetail');

  @override
  Future<dynamic> getTutorDetail({String id = "0"}) {
    return _$getTutorDetailAsyncAction.run(() => super.getTutorDetail(id: id));
  }

  final _$getTutorSpecialtiesAsyncAsyncAction =
      AsyncAction('_TutorStore.getTutorSpecialtiesAsync');

  @override
  Future<dynamic> getTutorSpecialtiesAsync() {
    return _$getTutorSpecialtiesAsyncAsyncAction
        .run(() => super.getTutorSpecialtiesAsync());
  }

  final _$_TutorStoreActionController = ActionController(name: '_TutorStore');

  @override
  void unSelectTutor() {
    final _$actionInfo = _$_TutorStoreActionController.startAction(
        name: '_TutorStore.unSelectTutor');
    try {
      return super.unSelectTutor();
    } finally {
      _$_TutorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tutorResponseFuture: ${tutorResponseFuture},
selectedTutorId: ${selectedTutorId},
tutorDetailFuture: ${tutorDetailFuture},
tutorSpecialties: ${tutorSpecialties},
selectedSpecialty: ${selectedSpecialty},
rowOfTutor: ${rowOfTutor},
favoriteTutorList: ${favoriteTutorList}
    ''';
  }
}
