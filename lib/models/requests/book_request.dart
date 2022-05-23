import 'package:json_annotation/json_annotation.dart';

part 'book_request.g.dart';

@JsonSerializable(explicitToJson: true)
class BookRequest {
  final String? note;
  final List<String>? scheduleDetailIds;
  BookRequest({this.note, this.scheduleDetailIds});

  factory BookRequest.fromJson(Map<String, dynamic> json) =>
      _$BookRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BookRequestToJson(this);
}