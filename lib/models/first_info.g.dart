// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirstInfo _$FirstInfoFromJson(Map<String, dynamic> json) => FirstInfo(
      level: json['level'] as String?,
      email: json['email'] as String?,
      google: json['google'] as String?,
      facebook: json['facebook'],
      apple: json['apple'],
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      language: json['language'] as String?,
      birthday: json['birthday'] as String?,
      requestPassword: json['requestPassword'] as bool?,
      isActivated: json['isActivated'] as bool?,
      isPhoneActivated: json['isPhoneActivated'] as bool?,
      requireNote: json['requireNote'],
      timezone: json['timezone'] as int?,
      phoneAuth: json['phoneAuth'],
      isPhoneAuthActivated: json['isPhoneAuthActivated'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'],
    );

Map<String, dynamic> _$FirstInfoToJson(FirstInfo instance) => <String, dynamic>{
      'level': instance.level,
      'email': instance.email,
      'google': instance.google,
      'facebook': instance.facebook,
      'apple': instance.apple,
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
      'phone': instance.phone,
      'language': instance.language,
      'birthday': instance.birthday,
      'requestPassword': instance.requestPassword,
      'isActivated': instance.isActivated,
      'isPhoneActivated': instance.isPhoneActivated,
      'requireNote': instance.requireNote,
      'timezone': instance.timezone,
      'phoneAuth': instance.phoneAuth,
      'isPhoneAuthActivated': instance.isPhoneAuthActivated,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };
