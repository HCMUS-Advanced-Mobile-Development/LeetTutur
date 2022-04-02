import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/tutor_info.dart';

part 'second_info.g.dart';

@JsonSerializable(explicitToJson: true)
class SecondInfo {
  String? id;
  String? level;
  String? email;
  dynamic google;
  dynamic facebook;
  dynamic apple;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  dynamic isPhoneActivated;
  dynamic requireNote;
  int? timezone;
  dynamic phoneAuth;
  bool? isPhoneAuthActivated;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  TutorInfo? tutorInfo;

  SecondInfo(
      {this.id,
      this.level,
      this.email,
      this.google,
      this.facebook,
      this.apple,
      this.avatar,
      this.name,
      this.country,
      this.phone,
      this.language,
      this.birthday,
      this.requestPassword,
      this.isActivated,
      this.isPhoneActivated,
      this.requireNote,
      this.timezone,
      this.phoneAuth,
      this.isPhoneAuthActivated,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.tutorInfo});

  factory SecondInfo.fromJson(Map<String, dynamic> json) =>
      _$SecondInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SecondInfoToJson(this);
}
