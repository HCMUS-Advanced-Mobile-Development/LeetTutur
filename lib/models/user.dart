import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/feedback.dart';
import 'package:leet_tutur/models/learn_topic.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String? id;
  String? email;
  String? name;
  dynamic google;
  dynamic facebook;
  dynamic apple;
  String? avatar;
  String? country;
  String? phone;
  List<String>? roles;
  String? language;
  String? birthday;
  bool? requestPassword;
  dynamic requireNote;
  bool? isActivated;
  String? level;
  List<LearnTopic>? learnTopics;
  bool? isPhoneActivated;
  dynamic phoneAuth;
  int? timezone;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Feedback>? feedbacks;
  List<dynamic>? courses;

  User(
      {this.id,
      this.email,
      this.name,
      this.google,
      this.facebook,
      this.apple,
      this.avatar,
      this.country,
      this.phone,
      this.roles,
      this.language,
      this.birthday,
      this.requestPassword,
      this.requireNote,
      this.isActivated,
      this.level,
      this.learnTopics,
      this.isPhoneActivated,
      this.phoneAuth,
      this.timezone,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.feedbacks,
      this.courses});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
