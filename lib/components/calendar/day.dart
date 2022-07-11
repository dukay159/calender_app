// ignore_for_file: use_key_in_widget_constructors

import 'package:app_lich_van_nien/components/calendar/constants.dart';
import 'package:app_lich_van_nien/components/calendar/dot.dart';
import 'package:app_lich_van_nien/components/calendar/utils.dart';
import 'package:app_lich_van_nien/core/utility.dart';
import 'package:flutter/material.dart';

class Day extends StatelessWidget {
  final double width;
  final DateTime date;
  final DateTime selectedDate;
  final List<DateTime> markedDays;
  final DateTime currentCalendar;
  final Function onDayPress;

  const Day({
    required this.width,
    required this.date,
    required this.currentCalendar,
    required this.onDayPress,
    required this.markedDays,
    required this.selectedDate,
  });

  bool checkMarked() {
    bool marked = false;
    for (var element in markedDays) {
      if (element.day == date.day && element.month == date.month) {
        marked = true;
      }
    }
    return marked;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var notInMainCalendar = false;
    DateTime now = DateTime.now();
    // ngày âm bên dưới ngày dương
    var lunarDay = convertSolar2Lunar(date.day, date.month, date.year, 7)[0];
    var lunarMonth = convertSolar2Lunar(date.day, date.month, date.year, 7)[1];
    //box color, text color
    var boxColor = Colors.transparent;
    Color dotColor = DOT_COLOR;
    var textColor = DAY_TEXT_NORMAL;
    //check xem có phải ngày của tháng khác hay ko
    if (isOtherMonth(date, currentCalendar)) {
      //nếu là ngày tháng khác thì ko nằm trong lịch tháng này = true
      notInMainCalendar = true;
    }
    if (equalDate(now, date)) {
      boxColor = BOX_TODAY_COLOR;
      textColor = DAY_TEXT_SELECTED;
    }
    if (equalDate(selectedDate, date)) {
      boxColor = BOX_SELECTED_COLOR;
      textColor = DAY_TEXT_SELECTED;
    }
    var isShowDot = checkMarked();
    //dot color(màu của chấm sự kiện khi đc click vào)
    if (boxColor != Colors.transparent) {
      dotColor = Colors.white;
    }
// nếu mà ko nằm trong lịch của tháng này thì ko show dot(sự kiện)
    if (notInMainCalendar) {
      textColor = DAY_TEXT_OTHER; // text xám
      isShowDot = false;
    }

    var dayStyle =
        TextStyle(fontSize: 18, color: textColor, fontWeight: FontWeight.bold);
    var lunarDayStyle = TextStyle(fontSize: 10, color: textColor);

    return GestureDetector(
        onTap: () {
          onDayPress(date);
        },
        child: Container(
            color: Colors.black.withOpacity(0.5),
            padding: const EdgeInsets.all(6),
            child: Stack(
              children: <Widget>[
                Container(
                  width: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        date.day.toString(),
                        style: dayStyle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '$lunarDay/$lunarMonth',
                        style: lunarDayStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: boxColor),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Dot(isShowDot, dotColor))
              ],
            ),
            width: width,
            height: width));
  }
}
