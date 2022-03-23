class CourseModel {
  String? title = "";
  String? subTitle = "";
  String? level = "";
  int? numberOfCourse = 1;
  String? thumbnail = "";
  String? courseTarget = "";
  String? courseOutcome = "";
  List<String>? topics = [];

  CourseModel(
      {this.title,
      this.subTitle,
      this.level,
      this.numberOfCourse,
      this.thumbnail,
      this.courseTarget,
      this.courseOutcome,
      this.topics});
}
