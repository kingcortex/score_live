import 'package:flutter/material.dart';

class HelpersFunctions {
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenwidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  static DateTime getDateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static List<DateTime> getLastNextDays({required int range}) {
    List<DateTime> nextDates = [];
    List<DateTime> lastDates = [];

    DateTime today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    List<DateTime> result = [today];
    for (int i = 0; i < range; i++) {
      nextDates.add(today.add(Duration(days: i + 1)));
    }
    for (int i = 0; i < range; i++) {
      lastDates.add(today.subtract(Duration(days: i + 1)));
    }

    result.insertAll(0, lastDates);
    result.insertAll(range + 1, nextDates);

    return result;
  }

  List<DateTime> getNextEightDays() {
    List<DateTime> dates = [];
    DateTime today = DateTime.now();
    for (int i = 0; i < 8; i++) {
      dates.add(today.add(Duration(days: i)));
    }
    return dates;
  }

  List<DateTime> getLastEightDays() {
    List<DateTime> dates = [];
    DateTime today = DateTime.now();
    for (int i = 0; i < 8; i++) {
      dates.add(today.subtract(Duration(days: i)));
    }
    return dates;
  }
}
