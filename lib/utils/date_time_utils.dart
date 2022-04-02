import 'package:intl/intl.dart';

class DateTimeUtils {
  static String casualHourFormatOf(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  static String formatDateAndTime(DateTime date) {
    return DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
        .add_jm()
        .format(date);
  }

  static String formatDate(DateTime date) {
    return DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
        .format(date);
  }

  static String formatTime(DateTime date) {
    return DateFormat(DateFormat.HOUR_MINUTE).format(date);
  }
}
