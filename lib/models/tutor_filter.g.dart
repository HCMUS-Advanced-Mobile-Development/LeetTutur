// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorFilter _$TutorFilterFromJson(Map<String, dynamic> json) => TutorFilter(
      specialties: (json['specialties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$TutorFilterToJson(TutorFilter instance) =>
    <String, dynamic>{
      'specialties': instance.specialties,
      'date': instance.date,
    };
