import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/learn_topic.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  List<String>? roles;
  String? language;
  String? birthday;
  bool? isActivated;
  String? level;
  List<LearnTopic>? learnTopics;
  bool? isPhoneActivated;
  int? timezone;

  User(
      {this.id,
      this.email,
      this.name,
      this.avatar,
      this.country,
      this.phone,
      this.roles,
      this.language,
      this.birthday,
      this.isActivated,
      this.level,
      this.learnTopics,
      this.isPhoneActivated,
      this.timezone});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
