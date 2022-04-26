import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/course.dart';
import 'package:leet_tutur/models/price_of_each_session.dart';
import 'package:leet_tutur/models/referral_info.dart';
import 'package:leet_tutur/models/tutor_info.dart';
import 'package:leet_tutur/models/user_feedback.dart';
import 'package:leet_tutur/models/learn_topic.dart';
import 'package:leet_tutur/models/wallet_info.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  List<String>? roles;
  String? language;
  String? birthday;
  bool? isActivated;
  TutorInfo? tutorInfo;
  WalletInfo? walletInfo;
  List<UserFeedback>? feedbacks;
  List<Course>? courses;
  String? requireNote;
  String? level;
  List<LearnTopic>? learnTopics;
  List<dynamic>? testPreparations;
  bool? isPhoneActivated;
  int? timezone;
  ReferralInfo? referralInfo;
  double? avgRating;
  PriceOfEachSession? priceOfEachSession;

  User({this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    this.isActivated,
    this.tutorInfo,
    this.walletInfo,
    this.feedbacks,
    this.courses,
    this.requireNote,
    this.level,
    this.learnTopics,
    this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
    this.referralInfo,
    this.avgRating,
    this.priceOfEachSession});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
