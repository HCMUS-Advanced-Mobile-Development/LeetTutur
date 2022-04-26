import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/referral_pack_info.dart';

part 'referral_info.g.dart';

@JsonSerializable(explicitToJson: true)
class ReferralInfo {
  int? id;
  String? referralCode;
  String? userId;
  int? referralPackId;
  String? createdAt;
  String? updatedAt;
  ReferralPackInfo? referralPackInfo;

  ReferralInfo({this.id,
    this.referralCode,
    this.userId,
    this.referralPackId,
    this.createdAt,
    this.updatedAt,
    this.referralPackInfo});

  factory ReferralInfo.fromJson(Map<String, dynamic> json) =>
      _$ReferralInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ReferralInfoToJson(this);
}