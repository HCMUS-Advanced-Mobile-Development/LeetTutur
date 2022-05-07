// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `1 on 1 online education platform`
  String get intro {
    return Intl.message(
      '1 on 1 online education platform',
      name: 'intro',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address`
  String get enterMail {
    return Intl.message(
      'Enter your email address',
      name: 'enterMail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `or with`
  String get orWith {
    return Intl.message(
      'or with',
      name: 'orWith',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get confirmPassword {
    return Intl.message(
      'Confirm your password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset your password`
  String get resetPassword {
    return Intl.message(
      'Reset your password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter correct email format`
  String get pleaseEnterCorrectEmailFormat {
    return Intl.message(
      'Please enter correct email format',
      name: 'pleaseEnterCorrectEmailFormat',
      desc: '',
      args: [],
    );
  }

  /// `Please enter some value`
  String get pleaseEnterSomeValue {
    return Intl.message(
      'Please enter some value',
      name: 'pleaseEnterSomeValue',
      desc: '',
      args: [],
    );
  }

  /// `Your password is incorrect`
  String get yourPasswordIsInCorrect {
    return Intl.message(
      'Your password is incorrect',
      name: 'yourPasswordIsInCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Tutor`
  String get tutor {
    return Intl.message(
      'Tutor',
      name: 'tutor',
      desc: '',
      args: [],
    );
  }

  /// `Tutor details`
  String get tutorDetails {
    return Intl.message(
      'Tutor details',
      name: 'tutorDetails',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule {
    return Intl.message(
      'Schedule',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Learn History`
  String get learnHistory {
    return Intl.message(
      'Learn History',
      name: 'learnHistory',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get courses {
    return Intl.message(
      'Courses',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message(
      'Search...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get book {
    return Intl.message(
      'Book',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `Show more`
  String get showMore {
    return Intl.message(
      'Show more',
      name: 'showMore',
      desc: '',
      args: [],
    );
  }

  /// `Show less`
  String get showLess {
    return Intl.message(
      'Show less',
      name: 'showLess',
      desc: '',
      args: [],
    );
  }

  /// `Specialties`
  String get specialties {
    return Intl.message(
      'Specialties',
      name: 'specialties',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Your total learned hours are`
  String get yourTotalLearnedHoursAre {
    return Intl.message(
      'Your total learned hours are',
      name: 'yourTotalLearnedHoursAre',
      desc: '',
      args: [],
    );
  }

  /// `Learning History`
  String get learningHistory {
    return Intl.message(
      'Learning History',
      name: 'learningHistory',
      desc: '',
      args: [],
    );
  }

  /// `hours`
  String get hours {
    return Intl.message(
      'hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Classes`
  String get upcomingClasses {
    return Intl.message(
      'Upcoming Classes',
      name: 'upcomingClasses',
      desc: '',
      args: [],
    );
  }

  /// `Time of the Class`
  String get timeOfTheClass {
    return Intl.message(
      'Time of the Class',
      name: 'timeOfTheClass',
      desc: '',
      args: [],
    );
  }

  /// `Class Requirement`
  String get classRequirement {
    return Intl.message(
      'Class Requirement',
      name: 'classRequirement',
      desc: '',
      args: [],
    );
  }

  /// `Lessons`
  String get lessons {
    return Intl.message(
      'Lessons',
      name: 'lessons',
      desc: '',
      args: [],
    );
  }

  /// `Course Details`
  String get courseDetail {
    return Intl.message(
      'Course Details',
      name: 'courseDetail',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `Overall`
  String get overall {
    return Intl.message(
      'Overall',
      name: 'overall',
      desc: '',
      args: [],
    );
  }

  /// `Why you should learn this course`
  String get whyYouShouldLearnThisCourse {
    return Intl.message(
      'Why you should learn this course',
      name: 'whyYouShouldLearnThisCourse',
      desc: '',
      args: [],
    );
  }

  /// `What you achieved`
  String get whatYouAchieve {
    return Intl.message(
      'What you achieved',
      name: 'whatYouAchieve',
      desc: '',
      args: [],
    );
  }

  /// `Topics`
  String get topics {
    return Intl.message(
      'Topics',
      name: 'topics',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Nation`
  String get nation {
    return Intl.message(
      'Nation',
      name: 'nation',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get level {
    return Intl.message(
      'Level',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Study Room`
  String get studyRoom {
    return Intl.message(
      'Study Room',
      name: 'studyRoom',
      desc: '',
      args: [],
    );
  }

  /// `Wait Time`
  String get waitTime {
    return Intl.message(
      'Wait Time',
      name: 'waitTime',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message(
      'Empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Any Level`
  String get anyLevel {
    return Intl.message(
      'Any Level',
      name: 'anyLevel',
      desc: '',
      args: [],
    );
  }

  /// `Beginners`
  String get beginners {
    return Intl.message(
      'Beginners',
      name: 'beginners',
      desc: '',
      args: [],
    );
  }

  /// `Upper Beginners`
  String get upperBeginners {
    return Intl.message(
      'Upper Beginners',
      name: 'upperBeginners',
      desc: '',
      args: [],
    );
  }

  /// `Pre-intermediate`
  String get preIntermediate {
    return Intl.message(
      'Pre-intermediate',
      name: 'preIntermediate',
      desc: '',
      args: [],
    );
  }

  /// `Intermediate`
  String get intermediate {
    return Intl.message(
      'Intermediate',
      name: 'intermediate',
      desc: '',
      args: [],
    );
  }

  /// `Upper Intermediate`
  String get upperIntermediate {
    return Intl.message(
      'Upper Intermediate',
      name: 'upperIntermediate',
      desc: '',
      args: [],
    );
  }

  /// `Pre-Advance`
  String get preAdvance {
    return Intl.message(
      'Pre-Advance',
      name: 'preAdvance',
      desc: '',
      args: [],
    );
  }

  /// `Advance`
  String get advance {
    return Intl.message(
      'Advance',
      name: 'advance',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get processing {
    return Intl.message(
      'Processing',
      name: 'processing',
      desc: '',
      args: [],
    );
  }

  /// `Register Successfully. Check Your Mail`
  String get registerSuccessfullyCheckYourMail {
    return Intl.message(
      'Register Successfully. Check Your Mail',
      name: 'registerSuccessfullyCheckYourMail',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password. Please check your email`
  String get resetPasswordCheckYourMail {
    return Intl.message(
      'Reset Password. Please check your email',
      name: 'resetPasswordCheckYourMail',
      desc: '',
      args: [],
    );
  }

  /// `Nothing Here`
  String get nothingHere {
    return Intl.message(
      'Nothing Here',
      name: 'nothingHere',
      desc: '',
      args: [],
    );
  }

  /// `Ups!! Some error occurred!!`
  String get error {
    return Intl.message(
      'Ups!! Some error occurred!!',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Is Booked`
  String get isBooked {
    return Intl.message(
      'Is Booked',
      name: 'isBooked',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Want to learn`
  String get wantToLearn {
    return Intl.message(
      'Want to learn',
      name: 'wantToLearn',
      desc: '',
      args: [],
    );
  }

  /// `Learn topics`
  String get learnTopics {
    return Intl.message(
      'Learn topics',
      name: 'learnTopics',
      desc: '',
      args: [],
    );
  }

  /// `Test Preparations`
  String get testPreparations {
    return Intl.message(
      'Test Preparations',
      name: 'testPreparations',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel class?`
  String get areYouSureWantToCancelClass {
    return Intl.message(
      'Are you sure you want to cancel class?',
      name: 'areYouSureWantToCancelClass',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `This field must be at least six characters long`
  String get thisFieldMustBeMoreThanSixChar {
    return Intl.message(
      'This field must be at least six characters long',
      name: 'thisFieldMustBeMoreThanSixChar',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Change password successfully`
  String get changePasswordSuccessfully {
    return Intl.message(
      'Change password successfully',
      name: 'changePasswordSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
