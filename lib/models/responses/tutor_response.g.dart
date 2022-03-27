// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorResponse _$TutorResponseFromJson(Map<String, dynamic> json) =>
    TutorResponse(
      tutors: json['tutors'] == null
          ? null
          : RowOfTutor.fromJson(json['tutors'] as Map<String, dynamic>),
      favoriteTutor: (json['favoriteTutor'] as List<dynamic>?)
          ?.map((e) => FavoriteTutor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TutorResponseToJson(TutorResponse instance) =>
    <String, dynamic>{
      'tutors': instance.tutors?.toJson(),
      'favoriteTutor': instance.favoriteTutor?.map((e) => e.toJson()).toList(),
    };
