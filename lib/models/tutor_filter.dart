import 'package:json_annotation/json_annotation.dart';

part 'tutor_filter.g.dart';

@JsonSerializable(explicitToJson: true)
class TutorFilter {
    List<String>? specialties;
    String? date;

    TutorFilter({this.specialties, this.date});

    factory TutorFilter.fromJson(Map<String, dynamic> json) => _$TutorFilterFromJson(json);

    Map<String, dynamic> toJson() => _$TutorFilterToJson(this);
}