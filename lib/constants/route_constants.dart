import 'package:flutter/material.dart';
import 'package:leet_tutur/ui/auth/forgot_password.dart';
import 'package:leet_tutur/ui/auth/login.dart';
import 'package:leet_tutur/ui/auth/register.dart';
import 'package:leet_tutur/ui/change_password/change_password.dart';
import 'package:leet_tutur/ui/chat_room/chat_room.dart';
import 'package:leet_tutur/ui/course_detail/course_detail.dart';
import 'package:leet_tutur/ui/home_tabs/home_tabs.dart';
import 'package:leet_tutur/ui/learn_history/learn_history.dart';
import 'package:leet_tutur/ui/pdf_viewer/pdf_viewer.dart';
import 'package:leet_tutur/ui/profile/profile.dart';
import 'package:leet_tutur/ui/study_room/study_room.dart';
import 'package:leet_tutur/ui/system_settings/system_settings.dart';
import 'package:leet_tutur/ui/tutor_detail/tutor_detail.dart';


class RouteConstants {
  static const login = "LOGIN";
  static const register = "REGISTER";
  static const forgotPassword = "FORGOT PASSWORD";
  static const homeTabs = "HOME TABS";
  static const tutorDetail = "TUTOR DETAIL";
  static const learnHistory = "LEARN HISTORY";
  static const courseDetail = "COURSE DETAIL";
  static const profile = "PROFILE";
  static const systemSettings = "SYSTEM SETTINGS";
  static const studyRoom = "STUDY ROOM";
  static const pdfViewer = "PDF VIEWER";
  static const changePassword = "CHANGE PASSWORD";
  static const chatRoom = "CHAT ROOM";

  static final routesMap = <String, WidgetBuilder>{
    login: (BuildContext context) => const Login(),
    register: (BuildContext context) => const Register(),
    forgotPassword: (BuildContext context) => const ForgotPassword(),
    homeTabs: (BuildContext context) => const HomeTabs(),
    tutorDetail: (BuildContext context) => const TutorDetail(),
    learnHistory: (BuildContext context) => const LearnHistory(),
    courseDetail: (BuildContext context) => const CourseDetail(),
    profile: (BuildContext context) => const Profile(),
    systemSettings: (BuildContext context) => const SystemSettings(),
    studyRoom: (BuildContext context) => const StudyRoom(),
    pdfViewer: (BuildContext context) => const PdfViewer(),
    changePassword: (BuildContext context) => const ChangePassword(),
    chatRoom: (BuildContext context) => const ChatRoom(),
  };
}
