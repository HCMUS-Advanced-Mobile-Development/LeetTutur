import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/first_info.dart';

part 'feedback.g.dart';

@JsonSerializable(explicitToJson: true)
class Feedback {
    String? id;
    String? bookingId;
    String? firstId;
    String? secondId;
    int? rating;
    String? content;
    String? createdAt;
    String? updatedAt;
    FirstInfo? firstInfo;

    Feedback(
        {this.id,
            this.bookingId,
            this.firstId,
            this.secondId,
            this.rating,
            this.content,
            this.createdAt,
            this.updatedAt,
            this.firstInfo});

    factory Feedback.fromJson(Map<String, dynamic> json) => _$FeedbackFromJson(json);

    Map<String, dynamic> toJson() => _$FeedbackToJson(this);
}