import 'package:json_annotation/json_annotation.dart';

part 'base_request.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseRequest {
  int? page;
  int? perPage;

  BaseRequest({this.page, this.perPage});

  factory BaseRequest.fromJson(Map<String, dynamic> json) =>
      _$BaseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BaseRequestToJson(this);
}
