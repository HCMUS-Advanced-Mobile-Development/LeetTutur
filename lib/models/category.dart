import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  String? id;
  String? title;
  String? description;
  String? key;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
      this.title,
      this.description,
      this.key,
      this.createdAt,
      this.updatedAt});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
