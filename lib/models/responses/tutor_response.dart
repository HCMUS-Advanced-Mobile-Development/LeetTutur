import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/favorite_tutor.dart';
import 'package:leet_tutur/models/row_of_tutor.dart';

part 'tutor_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TutorResponse {
  RowOfTutor? tutors;
  List<FavoriteTutor>? favoriteTutor;

  TutorResponse({this.tutors, this.favoriteTutor});

  factory TutorResponse.fromJson(Map<String, dynamic> json) =>
      _$TutorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TutorResponseToJson(this);
}
