import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/first_info.dart';

part 'user_feedback.g.dart';

@JsonSerializable(explicitToJson: true)
class UserFeedback {
    String? id;
    String? bookingId;
    String? firstId;
    String? secondId;
    int? rating;
    String? content;
    String? createdAt;
    String? updatedAt;
    FirstInfo? firstInfo;

    UserFeedback(
        {this.id,
            this.bookingId,
            this.firstId,
            this.secondId,
            this.rating,
            this.content,
            this.createdAt,
            this.updatedAt,
            this.firstInfo});

    factory UserFeedback.fromJson(Map<String, dynamic> json) => _$UserFeedbackFromJson(json);

    Map<String, dynamic> toJson() => _$UserFeedbackToJson(this);
}