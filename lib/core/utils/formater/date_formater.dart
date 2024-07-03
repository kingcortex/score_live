import 'package:intl/intl.dart';

class DateFormater {
  static String formatDateTime(DateTime date) {
    DateTime today = DateTime.now();
    DateFormat formatter = DateFormat('EEE\n dd MMM', 'en_US');
    String formattedDate = formatter.format(date);

    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      formattedDate =
          formattedDate.replaceFirst(DateFormat('EEE').format(date), 'Today');
    }

    return formattedDate;
  }
}
