import 'package:json_annotation/json_annotation.dart';

part 'referral_pack_info.g.dart';

@JsonSerializable(explicitToJson: true)
class ReferralPackInfo {
  int? id;
  int? earnPercent;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  ReferralPackInfo({this.id,
    this.earnPercent,
    this.isActive,
    this.createdAt,
    this.updatedAt});

  factory ReferralPackInfo.fromJson(Map<String, dynamic> json) =>
      _$ReferralPackInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ReferralPackInfoToJson(this);
}