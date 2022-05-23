// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_pack_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferralPackInfo _$ReferralPackInfoFromJson(Map<String, dynamic> json) =>
    ReferralPackInfo(
      id: json['id'] as int?,
      earnPercent: json['earnPercent'] as int?,
      isActive: json['isActive'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ReferralPackInfoToJson(ReferralPackInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'earnPercent': instance.earnPercent,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
