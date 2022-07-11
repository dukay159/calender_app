// ignore_for_file: must_call_super, no_logic_in_create_state, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:app_lich_van_nien/components/calendar/constants.dart';
import 'package:app_lich_van_nien/components/calendar/day.dart';
import 'package:app_lich_van_nien/components/calendar/day_of_week.dart';
import 'package:app_lich_van_nien/components/calendar/header.dart';
import 'package:app_lich_van_nien/components/calendar/utils.dart';
import 'package:app_lich_van_nien/components/event/EventList.dart';
import 'package:app_lich_van_nien/core/utility.dart';
import 'package:app_lich_van_nien/data/models/EventVO.dart';
import 'package:app_lich_van_nien/data/repositories/mocks/api_connection_mock.dart';
import 'package:app_lich_van_nien/presentation/widgets/swipe_detector.dart';

import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  final List<DateTime> markedDays;
  final Function onDateTimeChanged;
  const Calendar({required this.markedDays, required this.onDateTimeChanged});

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _CalendarState(markedDays, onDateTimeChanged);
  }
}

class _CalendarState extends State<Calendar> with TickerProviderStateMixin {
  _CalendarState(this.markedDays, this.onDateTimeChanged);
  final Function onDateTimeChanged;
  List<EventVO> _eventByMonths = [];
  List<EventVO> _eventData = [];
  final List<DateTime> markedDays;
  late DateTime calendar;
  late DateTime selectedDate;
  late DateTime _selectedDate;
  //animation
  late AnimationController _controller;
  late Animation<Offset> _offsetFloat;

  @override
  void initState() {
    super.initState();
    calendar = DateTime.now();
    _getData(calendar);
    selectedDate = DateTime.now();
    _selectedDate = DateTime.now();
    //animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _offsetFloat = Tween<Offset>(begin: const Offset(1, 0.0), end: Offset.zero)
        .animate(_controller);

    _controller.forward();
  }

//in4 bên dưới lịch tháng
  Widget getDateInfoMonth() {
    var hourStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
    var hourHD = const TextStyle(color: Colors.white, fontSize: 18);
    var lunarStyle = const TextStyle(color: Colors.white, fontSize: 18);
    var lunarDates = convertSolar2Lunar(
        _selectedDate.day, _selectedDate.month, _selectedDate.year, 7);
    var lunarMonth = lunarDates[1];
    var lunarYear = lunarDates[2];
    var lunarMonthName = getCanChiMonth(lunarMonth, lunarYear);
    var lunarYearName = getCanChiYear(lunarYear);
    //get day and hour by can chi
    var jd = jdn(_selectedDate.day, _selectedDate.month, _selectedDate.year);
    var hoangDaoHour = getGioHoangDao(jd);
    var dayName = getCanDay(jd);

    var dayOfWeek = getNameDayofWeekMonth(_selectedDate);
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text(dayOfWeek , style: hourStyle),
                  ),
                  Padding(
                     padding: const EdgeInsets.only(top: 3.0),
                    child: Text(
                        '${selectedDate.day}-${selectedDate.month}-${selectedDate.year} ',
                        style: lunarStyle),
                  ),
                  Padding(
                     padding: const EdgeInsets.only(top: 3.0),
                    child: Text(hoangDaoHour, style: hourHD),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                     padding: const EdgeInsets.only(top: 3.0),
                    child: Text("Ngày $dayName", style: lunarStyle),
                  ),
                  Padding(
                     padding: const EdgeInsets.only(top: 3.0),
                    child: Text('Tháng $lunarMonthName', style: lunarStyle),
                  ),
                  Padding(
                     padding: const EdgeInsets.only(top: 3.0),
                    child: Text("Năm $lunarYearName", style: lunarStyle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gioHD() {
    //get day and hour by can chi
    var jd = jdn(_selectedDate.day, _selectedDate.month, _selectedDate.year);
    var hoangDaoHourCTsyle = const TextStyle(
      color: Colors.white,
      fontSize: 18,
    );
    var hoangDaoHourCT = getGioHoangDaoCT(jd);

    var barHDstyle = const TextStyle(
        color: Colors.yellow, fontSize: 18, fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 150,
        width: 380,
        child: Container(
            color: Colors.black.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  Container(
                      width: 360,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: Text(
                        'GIỜ HOÀNG ĐẠO',
                        style: barHDstyle,
                        textAlign: TextAlign.center,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(hoangDaoHourCT[0],
                                    style: hoangDaoHourCTsyle),
                                Text(hoangDaoHourCT[1],
                                    style: hoangDaoHourCTsyle),
                                Text(hoangDaoHourCT[2],
                                    style: hoangDaoHourCTsyle),
                              ],
                            ),
                            Column(children: [
                              Text(hoangDaoHourCT[3],
                                  style: hoangDaoHourCTsyle),
                              Text(hoangDaoHourCT[4],
                                  style: hoangDaoHourCTsyle),
                              Text(hoangDaoHourCT[5],
                                  style: hoangDaoHourCTsyle),
                            ])
                          ]
                          )
                          ),
                ],
              ),
            )
            ),
      ),
    );
  }

  Widget eventMonth() {
    var barHDstyle = const TextStyle(
        color: Colors.yellow, fontSize: 18, fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 150,
        width: 380,
        child: Container(
            color: Colors.black.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  Container(
                      width: 360,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: Text(
                        'SỰ KIỆN',
                        style: barHDstyle,
                        textAlign: TextAlign.center,
                      )),
                  Expanded(
                      flex: 1,
                      child: EventList(
                        data: _eventByMonths,
                      ))
                ],
              ),
            )),
      ),
    );
  }

  Widget getDateOfWeekHeader(dayWidth) {
    List<Widget> listDay = [];
    for (int i = 0; i < days.length; i++) {
      listDay.add(DayOfWeek(days[i], dayWidth));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: listDay,
    );
  }

  Widget getMonthComponent() {
    var width = MediaQuery.of(context)
        .size
        .width; //mediaQuery.of thiết kế bố cục phù hợp
    var dayWidth = width / 7;
    int year = calendar.year;
    int month = calendar.month;
    var lastDayMonth = lastDayOfMonth(calendar);
    List<Widget> rowItems = [];

    List<Widget> columnItems = [
      getDateOfWeekHeader(dayWidth),
    ];
    var numItem = 0;
// first day of month
    DateTime firstDayOfTheMonth = firstDayOfWeek(DateTime(year, month, 1));
    if (firstDayOfTheMonth.day > 1) {
      //previous month
      DateTime lastDayPreMonth = lastDayOfPreviousMonth(calendar);
      for (int i = firstDayOfTheMonth.day; i <= lastDayPreMonth.day; i++) {
        numItem++;
        Day day = Day(
          width: dayWidth,
          date: DateTime(firstDayOfTheMonth.year, firstDayOfTheMonth.month, i),
          currentCalendar: calendar,
          onDayPress: onDayPress,
          markedDays: markedDays,
          selectedDate: selectedDate,
        );
        rowItems.add(day);
      }
    }
    for (int i = 1; i <= lastDayMonth.day; i++) {
      //current month
      numItem++;
      Day day = Day(
        width: dayWidth,
        date: DateTime(calendar.year, calendar.month, i),
        currentCalendar: calendar,
        onDayPress: onDayPress,
        markedDays: markedDays,
        selectedDate: selectedDate,
      );
      rowItems.add(day);
      if (numItem % 7 == 0) {
        columnItems.add(Row(children: rowItems));
        rowItems = [];
      }
    }
    var endDayWeek =
        endDayOfWeek(DateTime(calendar.year, calendar.month, lastDayMonth.day));
    if (endDayWeek.day < 10) {
      // have next month
      for (int i = 1; i <= endDayWeek.day; i++) {
        //current month
        numItem++;
        Day day = Day(
          width: dayWidth,
          date: DateTime(endDayWeek.year, endDayWeek.month, i),
          currentCalendar: calendar,
          onDayPress: onDayPress,
          markedDays: markedDays,
          selectedDate: selectedDate,
        );
        rowItems.add(day);
        if (numItem % 7 == 0) {
          columnItems.add(Row(children: rowItems));
          rowItems = [];
        }
      }
    }
    if (rowItems.isNotEmpty) {
      columnItems.add(Row(children: rowItems));
    }

    return Column(
      children: [
        SlideTransition(
          position: _offsetFloat,
          child: SwipeDetector(
            child: Column(children: columnItems),
            onSwipeLeft: () {
              onPreviousPress();
              _getData(calendar);
            },
            onSwipeRight: () {
              onNextPress();
              _getData(calendar);
            },
          ),
        ),
        getDateInfoMonth(),
        gioHD(),
        eventMonth(),
      ],
    );
  }

  onDayPress(date) {
    setState(() {
      selectedDate = date;
      _selectedDate = date;
    });
    if (isOtherMonth(date, calendar)) {
      setState(() {
        calendar = date;
      });
    }
  }

  onPreviousPress() {
    var newCalendar = decreaseMonth(calendar);
    setState(() {
      calendar = newCalendar;
    });
    onChangeMonth(newCalendar);
    _offsetFloat = Tween<Offset>(begin: const Offset(-1, 0.0), end: Offset.zero)
        .animate(_controller);
    _controller.value = 0.0;
    _controller.forward();
  }

  onNextPress() {
    var newCalendar = increaseMonth(calendar);
    setState(() {
      calendar = newCalendar;
    });

    onChangeMonth(newCalendar);
    _offsetFloat = Tween<Offset>(begin: const Offset(1, 0.0), end: Offset.zero)
        .animate(_controller);
    _controller.value = 0.0;
    _controller.forward();
  }

  onChangeMonth(DateTime newCalendar) {
    onDateTimeChanged(newCalendar);
  }

  _getData(DateTime date) async {
    var data = await loadEventData();
    setState(() {
      _eventData = data;
    });
    generateEventByMonth(date.month);
  }

  generateEventByMonth(int month) {
    _eventByMonths.clear();
    for (var event in _eventData) {
      if (event.date.month == month) {
        _eventByMonths.add(event);
      }
    }
    setState(() {
      _eventByMonths = _eventByMonths;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Column(
      children: <Widget>[
        Header(
          currentMonth: calendar,
          onPreviousPress: onPreviousPress,
          onNextPress: onNextPress,
        ),
        getMonthComponent(),
      ],
    );
  }
}




