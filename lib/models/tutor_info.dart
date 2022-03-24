import 'package:json_annotation/json_annotation.dart';

part 'tutor_info.g.dart';

@JsonSerializable(explicitToJson: true)
class TutorInfo {
  String? id;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  dynamic accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  dynamic resume;
  bool? isActivated;
  dynamic isNative;
  String? createdAt;
  String? updatedAt;

  TutorInfo(
      {this.id,
      this.userId,
      this.video,
      this.bio,
      this.education,
      this.experience,
      this.profession,
      this.accent,
      this.targetStudent,
      this.interests,
      this.languages,
      this.specialties,
      this.resume,
      this.isActivated,
      this.isNative,
      this.createdAt,
      this.updatedAt});

  factory TutorInfo.fromJson(Map<String, dynamic> json) =>
      _$TutorInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TutorInfoToJson(this);
}
