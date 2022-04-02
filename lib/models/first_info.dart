import 'package:json_annotation/json_annotation.dart';

part 'first_info.g.dart';

@JsonSerializable(explicitToJson: true)
class FirstInfo {
  String? id;
  String? level;
  String? email;
  String? google;
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
  bool? isPhoneActivated;
  dynamic requireNote;
  int? timezone;
  dynamic phoneAuth;
  bool? isPhoneAuthActivated;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  FirstInfo(
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
      this.deletedAt});

  factory FirstInfo.fromJson(Map<String, dynamic> json) =>
      _$FirstInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FirstInfoToJson(this);
}
