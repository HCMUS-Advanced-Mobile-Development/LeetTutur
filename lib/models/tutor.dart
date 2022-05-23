import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/user_feedback.dart';
import 'package:leet_tutur/models/user.dart';

part 'tutor.g.dart';

@JsonSerializable(explicitToJson: true)
class Tutor {
  String? level;
  String? email;
  dynamic google;
  dynamic facebook;
  dynamic apple;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  dynamic isPhoneActivated;
  dynamic requireNote;
  int? timezone;
  dynamic phoneAuth;
  bool? isPhoneAuthActivated;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<UserFeedback>? feedbacks;
  String? id;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  dynamic accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  dynamic resume;
  dynamic isNative;
  @JsonKey(name: "User")
  User? user;
  bool? isFavorite;
  double? avgRating;
  int? price;
  bool? isOnline;

  Tutor(
      {this.level,
      this.email,
      this.google,
      this.facebook,
      this.apple,
      this.avatar,
      this.name,
      this.country,
      this.phone,
      this.language,
      this.birthday,
      this.requestPassword,
      this.isActivated,
      this.isPhoneActivated,
      this.requireNote,
      this.timezone,
      this.phoneAuth,
      this.isPhoneAuthActivated,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.feedbacks,
      this.id,
      this.userId,
      this.video,
      this.bio,
      this.education,
      this.experience,
      this.profession,
      this.accent,
      this.targetStudent,
      this.interests,
      this.languages,
      this.specialties,
      this.resume,
      this.isNative,
      this.user,
      this.isFavorite,
      this.avgRating,
      this.price,
      this.isOnline});

  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);

  Map<String, dynamic> toJson() => _$TutorToJson(this);

  int getStars() {
    var totalRating = 0;
    final avgRating = this.avgRating;
    if (avgRating != null) {
      totalRating = avgRating.toInt();
    }
    else {
      totalRating = feedbacks
          ?.map((e) => e.rating)
          .reduce((value, element) => value! + element!)
          ?.ceil() ??
          0;
    }

    return totalRating ~/ (feedbacks?.length ?? 1);
  }
}
