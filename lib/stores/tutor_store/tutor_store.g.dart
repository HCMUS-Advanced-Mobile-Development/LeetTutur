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

  final _$tutorResponseAtom = Atom(name: '_TutorStore.tutorResponse');

  @override
  ObservableFuture<TutorResponse>? get tutorResponse {
    _$tutorResponseAtom.reportRead();
    return super.tutorResponse;
  }

  @override
  set tutorResponse(ObservableFuture<TutorResponse>? value) {
    _$tutorResponseAtom.reportWrite(value, super.tutorResponse, () {
      super.tutorResponse = value;
    });
  }

  @override
  String toString() {
    return '''
tutorResponse: ${tutorResponse},
rowOfTutor: ${rowOfTutor},
favoriteTutorList: ${favoriteTutorList}
    ''';
  }
}
