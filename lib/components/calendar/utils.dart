DateTime firstDayOfWeek(DateTime date) {
  int weekDay = date.weekday - 1;
  return date.subtract(Duration(days: weekDay));
}

DateTime endDayOfWeek(DateTime date) {
  int weekDay = 7 - date.weekday;
  return date.add(Duration(days: weekDay));
}

//tăng tháng
DateTime increaseMonth(DateTime date) {
  var month = date.month;
  var year = date.year;
  if (month == 12) {
    month = 1;
    year++;
  } else {
    month++;
  }
  return DateTime(year, month, 1);
}

//giảm tháng
DateTime decreaseMonth(DateTime date) {
  var month = date.month;
  var year = date.year;
  if (month == 1) {
    month = 12;
    year--;
  } else {
    month--;
  }
  return DateTime(year, month, 1);
}

bool isOtherMonth(DateTime date, DateTime currentMonth) {
  if (date.year == currentMonth.year && date.month == currentMonth.month) {
    return false;
  }
  return true;
}

bool equalDate(DateTime date1, DateTime date2) {
  // ignore: unnecessary_null_comparison
  if (date1 == null || date2 == null) {
    return false;
  }
  if (date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day) {
    return true;
  }
  return false;
}
