import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/generated/l10n.dart';
import 'package:leet_tutur/models/category.dart';
import 'package:leet_tutur/models/topic.dart';

part 'course.g.dart';

@JsonSerializable(explicitToJson: true)
class Course {
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  String? level;
  String? reason;
  String? purpose;
  String? otherDetails;
  int? defaultPrice;
  int? coursePrice;
  dynamic courseType;
  dynamic sectionType;
  bool? visible;
  String? createdAt;
  String? updatedAt;
  List<Topic>? topics;
  List<Category>? categories;

  Course(
      {this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.level,
      this.reason,
      this.purpose,
      this.otherDetails,
      this.defaultPrice,
      this.coursePrice,
      this.courseType,
      this.sectionType,
      this.visible,
      this.createdAt,
      this.updatedAt,
      this.topics,
      this.categories});

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  String getLevelName() {
    switch (level) {
      case "0":
        return S.current.anyLevel;
      case "1":
        return S.current.beginners;
      case "2":
        return S.current.upperBeginners;
      case "3":
        return S.current.preIntermediate;
      case "4":
        return S.current.intermediate;
      case "5":
        return S.current.upperIntermediate;
      case "6":
        return S.current.preAdvance;
      case "7":
        return S.current.advance;
      default:
        return S.current.anyLevel;
    }
  }
}
