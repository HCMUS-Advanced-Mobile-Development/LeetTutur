import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/report.dart';

part 'report_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ReportResponse {
  String? message;
  Report? data;

  ReportResponse({this.message, this.data});
  
  factory ReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportResponseToJson(this);
}