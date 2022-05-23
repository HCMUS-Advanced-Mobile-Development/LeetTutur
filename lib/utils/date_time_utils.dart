import 'package:intl/intl.dart';
import 'package:leet_tutur/generated/l10n.dart';

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

  static String formatDate(DateTime date,
      {String? format = DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY}) {
    return DateFormat(format).format(date);
  }

  static String formatTime(DateTime date) {
    return DateFormat(DateFormat.HOUR_MINUTE).format(date);
  }

  static String humanize(DateTime date) {
    final now = DateTime.now();

    final diff = now.difference(date);

    if (diff.inDays <= 1) {
      if (diff.inMinutes < 60) {
        return "${diff.inMinutes} ${S.current.minutesAgo}";
      } else {
        return "${diff.inHours} ${S.current.hoursAgo}";
      }
    } else if (diff.inDays <= 7) {
      return "${diff.inDays} ${S.current.daysAgo}";
    } else {
      return formatDate(date);
    }
  }

  static DateTime startOfToday() {
    var now = DateTime.now();

    return DateTime(now.year, now.month, now.day);
  }
}
