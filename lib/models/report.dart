import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable(explicitToJson: true)
class Report {
  String? id;
  String? userId;
  String? tutorId;
  String? content;
  String? updatedAt;
  String? createdAt;

  Report(
      {this.id,
      this.userId,
      this.tutorId,
      this.content,
      this.updatedAt,
      this.createdAt});

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  Map<String, dynamic> toJson() => _$ReportToJson(this);
}
