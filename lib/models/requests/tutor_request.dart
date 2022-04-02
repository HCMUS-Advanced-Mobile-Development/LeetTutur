import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/requests/base_request.dart';
import 'package:leet_tutur/models/tutor_filter.dart';

part 'tutor_request.g.dart';

@JsonSerializable(explicitToJson: true)
class TutorRequest extends BaseRequest {
  TutorFilter? filters;

  TutorRequest({this.filters});

  factory TutorRequest.fromJson(Map<String, dynamic> json) =>
      _$TutorRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TutorRequestToJson(this);
}
