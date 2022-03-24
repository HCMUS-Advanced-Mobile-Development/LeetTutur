import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/second_info.dart';

part 'favorite_tutor.g.dart';

@JsonSerializable(explicitToJson: true)
class FavoriteTutor {
  String? id;
  String? firstId;
  String? secondId;
  String? createdAt;
  String? updatedAt;
  SecondInfo? secondInfo;

  FavoriteTutor(
      {this.id,
      this.firstId,
      this.secondId,
      this.createdAt,
      this.updatedAt,
      this.secondInfo});

  factory FavoriteTutor.fromJson(Map<String, dynamic> json) =>
      _$FavoriteTutorFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteTutorToJson(this);
}
