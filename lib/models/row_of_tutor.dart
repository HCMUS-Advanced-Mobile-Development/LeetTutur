import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/tutor.dart';

part 'row_of_tutor.g.dart';

@JsonSerializable(explicitToJson: true)
class RowOfTutor {
  int? count;
  List<Tutor>? rows;

  RowOfTutor({this.count, this.rows});

  factory RowOfTutor.fromJson(Map<String, dynamic> json) =>
      _$RowOfTutorFromJson(json);

  Map<String, dynamic> toJson() => _$RowOfTutorToJson(this);
}
