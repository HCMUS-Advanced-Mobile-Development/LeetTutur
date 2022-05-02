import 'package:flutter/material.dart';
import 'package:leet_tutur/ui/auth/forgot_password.dart';
import 'package:leet_tutur/ui/auth/login.dart';
import 'package:leet_tutur/ui/auth/register.dart';
import 'package:leet_tutur/ui/course_detail/course_detail.dart';
import 'package:leet_tutur/ui/home_tabs/home_tabs.dart';
import 'package:leet_tutur/ui/learn_history/learn_history.dart';
import 'package:leet_tutur/ui/pdf_viewer/pdf_viewer.dart';
import 'package:leet_tutur/ui/profile/profile.dart';
import 'package:leet_tutur/ui/study_room/study_room.dart';
import 'package:leet_tutur/ui/system_settings/system_settings.dart';
import 'package:leet_tutur/ui/tutor_detail/tutor_detail.dart';


class RouteConstants {
  static const login = "login";
  static const register = "register";
  static const forgotPassword = "forgot password";
  static const homeTabs = "home tabs";
  static const tutorDetail = "tutor detail";
  static const learnHistory = "learn history";
  static const courseDetail = "Course detail";
  static const profile = "Profile";
  static const systemSettings = "System Settings";
  static const studyRoom = "Study Room";
  static const pdfViewer = "PDF Viewer";

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
    pdfViewer: (BuildContext context) => const PdfViewer()
  };
}
