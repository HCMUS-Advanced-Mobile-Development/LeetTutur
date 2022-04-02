// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorInfo _$TutorInfoFromJson(Map<String, dynamic> json) => TutorInfo(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      video: json['video'] as String?,
      bio: json['bio'] as String?,
      education: json['education'] as String?,
      experience: json['experience'] as String?,
      profession: json['profession'] as String?,
      accent: json['accent'],
      targetStudent: json['targetStudent'] as String?,
      interests: json['interests'] as String?,
      languages: json['languages'] as String?,
      specialties: json['specialties'] as String?,
      resume: json['resume'],
      isActivated: json['isActivated'] as bool?,
      isNative: json['isNative'],
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$TutorInfoToJson(TutorInfo instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'video': instance.video,
      'bio': instance.bio,
      'education': instance.education,
      'experience': instance.experience,
      'profession': instance.profession,
      'accent': instance.accent,
      'targetStudent': instance.targetStudent,
      'interests': instance.interests,
      'languages': instance.languages,
      'specialties': instance.specialties,
      'resume': instance.resume,
      'isActivated': instance.isActivated,
      'isNative': instance.isNative,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
