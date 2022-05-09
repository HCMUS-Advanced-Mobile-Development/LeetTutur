import 'package:json_annotation/json_annotation.dart';

part 'report_request.g.dart';

@JsonSerializable(explicitToJson: true)
class ReportRequest {
  String? tutorId;
  String? content;

  ReportRequest({this.tutorId, this.content});

  factory ReportRequest.fromJson(Map<String, dynamic> json) =>
      _$ReportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReportRequestToJson(this);
}
