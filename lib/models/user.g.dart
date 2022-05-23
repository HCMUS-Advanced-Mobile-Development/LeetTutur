// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      language: json['language'] as String?,
      birthday: json['birthday'] as String?,
      isActivated: json['isActivated'] as bool?,
      tutorInfo: json['tutorInfo'] == null
          ? null
          : TutorInfo.fromJson(json['tutorInfo'] as Map<String, dynamic>),
      walletInfo: json['walletInfo'] == null
          ? null
          : WalletInfo.fromJson(json['walletInfo'] as Map<String, dynamic>),
      feedbacks: (json['feedbacks'] as List<dynamic>?)
          ?.map((e) => UserFeedback.fromJson(e as Map<String, dynamic>))
          .toList(),
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      requireNote: json['requireNote'] as String?,
      level: json['level'] as String?,
      learnTopics: (json['learnTopics'] as List<dynamic>?)
          ?.map((e) => LearnTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
      testPreparations: (json['testPreparations'] as List<dynamic>?)
          ?.map((e) => LearnTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPhoneActivated: json['isPhoneActivated'] as bool?,
      timezone: json['timezone'] as int?,
      referralInfo: json['referralInfo'] == null
          ? null
          : ReferralInfo.fromJson(json['referralInfo'] as Map<String, dynamic>),
      avgRating: (json['avgRating'] as num?)?.toDouble(),
      priceOfEachSession: json['priceOfEachSession'] == null
          ? null
          : PriceOfEachSession.fromJson(
              json['priceOfEachSession'] as Map<String, dynamic>),
      isOnline: json['isOnline'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
      'country': instance.country,
      'phone': instance.phone,
      'roles': instance.roles,
      'language': instance.language,
      'birthday': instance.birthday,
      'isActivated': instance.isActivated,
      'tutorInfo': instance.tutorInfo?.toJson(),
      'walletInfo': instance.walletInfo?.toJson(),
      'feedbacks': instance.feedbacks?.map((e) => e.toJson()).toList(),
      'courses': instance.courses?.map((e) => e.toJson()).toList(),
      'requireNote': instance.requireNote,
      'level': instance.level,
      'learnTopics': instance.learnTopics?.map((e) => e.toJson()).toList(),
      'testPreparations':
          instance.testPreparations?.map((e) => e.toJson()).toList(),
      'isPhoneActivated': instance.isPhoneActivated,
      'timezone': instance.timezone,
      'referralInfo': instance.referralInfo?.toJson(),
      'avgRating': instance.avgRating,
      'priceOfEachSession': instance.priceOfEachSession?.toJson(),
      'isOnline': instance.isOnline,
    };
