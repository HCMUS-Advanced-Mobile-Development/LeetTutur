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

  late final _$tutorResponseFutureAtom =
      Atom(name: '_TutorStore.tutorResponseFuture', context: context);

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

  late final _$selectedTutorIdAtom =
      Atom(name: '_TutorStore.selectedTutorId', context: context);

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

  late final _$tutorDetailFutureAtom =
      Atom(name: '_TutorStore.tutorDetailFuture', context: context);

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

  late final _$tutorSpecialtyMapAtom =
      Atom(name: '_TutorStore.tutorSpecialtyMap', context: context);

  @override
  ObservableMap<String, String> get tutorSpecialtyMap {
    _$tutorSpecialtyMapAtom.reportRead();
    return super.tutorSpecialtyMap;
  }

  @override
  set tutorSpecialtyMap(ObservableMap<String, String> value) {
    _$tutorSpecialtyMapAtom.reportWrite(value, super.tutorSpecialtyMap, () {
      super.tutorSpecialtyMap = value;
    });
  }

  late final _$tutorCountryCodeMapAtom =
      Atom(name: '_TutorStore.tutorCountryCodeMap', context: context);

  @override
  ObservableMap<String, String> get tutorCountryCodeMap {
    _$tutorCountryCodeMapAtom.reportRead();
    return super.tutorCountryCodeMap;
  }

  @override
  set tutorCountryCodeMap(ObservableMap<String, String> value) {
    _$tutorCountryCodeMapAtom.reportWrite(value, super.tutorCountryCodeMap, () {
      super.tutorCountryCodeMap = value;
    });
  }

  late final _$selectedSpecialtyAtom =
      Atom(name: '_TutorStore.selectedSpecialty', context: context);

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

  late final _$searchTutorsAsyncAsyncAction =
      AsyncAction('_TutorStore.searchTutorsAsync', context: context);

  @override
  Future<TutorResponse> searchTutorsAsync({TutorRequest? request}) {
    return _$searchTutorsAsyncAsyncAction
        .run(() => super.searchTutorsAsync(request: request));
  }

  late final _$getTutorDetailAsyncAction =
      AsyncAction('_TutorStore.getTutorDetail', context: context);

  @override
  Future<dynamic> getTutorDetail({String id = "0"}) {
    return _$getTutorDetailAsyncAction.run(() => super.getTutorDetail(id: id));
  }

  late final _$getTutorSpecialtiesAsyncAsyncAction =
      AsyncAction('_TutorStore.getTutorSpecialtiesAsync', context: context);

  @override
  Future<dynamic> getTutorSpecialtiesAsync() {
    return _$getTutorSpecialtiesAsyncAsyncAction
        .run(() => super.getTutorSpecialtiesAsync());
  }

  late final _$getTutorCountryAsyncAsyncAction =
      AsyncAction('_TutorStore.getTutorCountryAsync', context: context);

  @override
  Future<Map<String, String>> getTutorCountryAsync() {
    return _$getTutorCountryAsyncAsyncAction
        .run(() => super.getTutorCountryAsync());
  }

  late final _$_TutorStoreActionController =
      ActionController(name: '_TutorStore', context: context);

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
tutorSpecialtyMap: ${tutorSpecialtyMap},
tutorCountryCodeMap: ${tutorCountryCodeMap},
selectedSpecialty: ${selectedSpecialty},
rowOfTutor: ${rowOfTutor},
favoriteTutorList: ${favoriteTutorList}
    ''';
  }
}
