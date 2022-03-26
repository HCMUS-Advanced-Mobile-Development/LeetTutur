import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/tutor_filter.dart';

part 'tutor_request.g.dart';

@JsonSerializable(explicitToJson: true)
class TutorRequest {
  TutorFilter? filters;
  int? page;
  int? perPage;

  TutorRequest({this.filters, this.page, this.perPage});

  factory TutorRequest.fromJson(Map<String, dynamic> json) =>
      _$TutorRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TutorRequestToJson(this);
}
