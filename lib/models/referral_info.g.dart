// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferralInfo _$ReferralInfoFromJson(Map<String, dynamic> json) => ReferralInfo(
      id: json['id'] as int?,
      referralCode: json['referralCode'] as String?,
      userId: json['userId'] as String?,
      referralPackId: json['referralPackId'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      referralPackInfo: json['referralPackInfo'] == null
          ? null
          : ReferralPackInfo.fromJson(
              json['referralPackInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReferralInfoToJson(ReferralInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'referralCode': instance.referralCode,
      'userId': instance.userId,
      'referralPackId': instance.referralPackId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'referralPackInfo': instance.referralPackInfo?.toJson(),
    };
