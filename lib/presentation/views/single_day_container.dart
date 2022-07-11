// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'package:app_lich_van_nien/core/utility.dart';
import 'package:app_lich_van_nien/data/models/QuoteVO.dart';
import 'package:app_lich_van_nien/presentation/widgets/selected_date_button.dart';
import 'package:app_lich_van_nien/presentation/widgets/stroxtext.dart';
import 'package:app_lich_van_nien/data/repositories/mocks/api_connection_mock.dart';
import 'package:app_lich_van_nien/presentation/widgets/swipe_detector.dart';
import 'package:flutter/material.dart';

class SingleDayContainer extends StatefulWidget {
  const SingleDayContainer({Key? key}) : super(key: key);

  @override
  State<SingleDayContainer> createState() => _SingleDayContainerState();
}

class _SingleDayContainerState extends State<SingleDayContainer> {
  List<QuoteVO> _quoteData = [];
  DateTime _selectedDate = DateTime.now();
  late Function onDateTimeChanged;

  @override
  void initState() {
    super.initState();
    _getData();

    //timer update datetime
    Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(() {
              DateTime now = DateTime.now();
              _selectedDate = DateTime(_selectedDate.year, _selectedDate.month,
                  _selectedDate.day, now.hour, now.minute, now.second);
            }));
  }

  _getData() async {
    var data = await loadQuoteData();
    setState(() {
      _quoteData = data;
    });
  }

  _onSwipeLeft() {
    setState(() {
      _selectedDate = decreaseDay(_selectedDate);
    });
  }

  _onSwipeRight() {
    setState(() {
      _selectedDate = increaseDay(_selectedDate);
    });
  }

  _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        //'DateTime?' is nullable and 'DateTime' isn't.
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1800),
        lastDate: DateTime(2100));

    // nếu ngày đc chọn khác null và khác ngày htai
    // thì chuyển ngày htai thành ngày đc chọn
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
//nếu thuộc tính đc chọn == vs giá trị trong file json thì
  Widget paddingText(double top, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: 40, right: 30),
      child: Text(text, style: style), //truyền text và style vào ko bị cố định
    );
  }

  Widget getHeader() {
    var title = 'Tháng ${_selectedDate.month} - ${_selectedDate.year}';

    var todayStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

    return Positioned(
      //Positioned định vị widget con của một Stack.
      top: 40,
      left: 10,
      right: 10,
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topRight,
              //SelectDateButton ycau 2 tham số (title, onpress)
              child: SelectDateButton(
                title: title,
                onPress: () {
                  _showDatePicker(context);
                },
              )),
          Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                  height: 40,
                  width: 100,
                  child: GestureDetector(
                    //click vào sẽ trở lại tgian ngày htai
                    onTap: () {
                      setState(() {
                        _selectedDate = DateTime.now();
                      });
                    },
                    child: Center(
                      child: Text(
                        "Hôm Nay",
                        style: todayStyle,
                      ),
                    ),
                  )))
        ],
      ),
    );
  }

  Widget getMainDate() {
    var backgroundIndex = (_selectedDate.day % 17);
    var dayOfWeek = getNameDayofWeek(_selectedDate);
    var quote = QuoteVO(" ", " ");
    if (_quoteData.isNotEmpty) {
      quote = _quoteData[_selectedDate.day % _quoteData.length];
    }
    const dayOfWeekStyle = TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 35,
    );

    const quoteStyle = TextStyle(
      color: Colors.white,
      fontSize: 20,
    );
    const quoteAuthorStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    return Expanded(
        child: SwipeDetector(
      onSwipeRight: () {
        _onSwipeRight();
      },
      onSwipeLeft: () {
        _onSwipeLeft();
      },
      child: (Stack(
        children: <Widget>[
          Positioned.fill(
            //Widget Positioned được sử dụng để định vị cho một widget con của một Stack.
            child: Image(
              image: AssetImage('assets/images/image_${backgroundIndex + 1}.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: StrokeText(
                    _selectedDate.day.toString(),
                    strokeWidth: 3,
                    fontSize: 120,
                    color: Colors.red,
                    strokeColor: Colors.white,
                  ),
                ),
                paddingText(0, dayOfWeek, dayOfWeekStyle), //thứ

                Expanded(
                  child: Align(
                  
                    alignment: Alignment.bottomLeft,
                    child: paddingText(10, quote.content, quoteStyle),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: paddingText(0, quote.author, quoteAuthorStyle),
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: getBarInfo(),
                ),

                SizedBox(
                  height: 130,
                  child: getDateInfo(),
                )
              ],
            ),
          ),
          getHeader(),
        ],
      )),
    ));
  }

//Viền ngăn cách giữa các cột
  Widget infoBox(Widget widget) {
    return Expanded(
      child: (Container(
        
        decoration: const BoxDecoration(
          border: Border(right: BorderSide(color: Colors.grey)),
        ),
        child: widget,
      )),
    );
  }

//thông tin chi tiết giờ/tháng/âm lịch
  Widget getDateInfo() {
    var hourStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25);
    var hourHD = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12);
    var lunarStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);
    var hourMinute = '${_selectedDate.hour} : ${_selectedDate.minute}';
    var lunarDates = convertSolar2Lunar(
        _selectedDate.day, _selectedDate.month, _selectedDate.year, 7);
    var lunarDay = lunarDates[0];
    var lunarMonth = lunarDates[1];
    var lunarYear = lunarDates[2];
    var lunarMonthName = getCanChiMonth(lunarMonth, lunarYear);
    var lunarYearName = getCanChiYear(lunarYear);
    //get day and hour by can chi
    var jd = jdn(_selectedDate.day, _selectedDate.month, _selectedDate.year);
    var hoangDaoHour = getGioHoangDao(jd);
    var dayName = getCanDay(jd);
//    print('day name is ${{dayName}}');
    var beginHourName = getBeginHour(jd);
    return Container(
        color: Colors.black.withOpacity(0.3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            infoBox(
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(hourMinute, style: hourStyle),
                  Text('Giờ $beginHourName', style: lunarStyle),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(hoangDaoHour,
                        style: hourHD, textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
            infoBox(
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: StrokeText(
                      ' $lunarDay',
                      strokeWidth: 1,
                      fontSize: 60,
                      color: Colors.red,
                      strokeColor: Colors.white,
                      
                    ),
                  ),
                ],
              ),
            ),
            infoBox(Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Năm $lunarYearName", style: lunarStyle),
                Text('Tháng $lunarMonthName', style: lunarStyle),
                Text("Ngày $dayName", style: lunarStyle),
              ],
            )),
          ],
        ));
  }

// thanh tiêu đề Giờ/ tháng/ âm lịch
  Widget getBarInfo() {
    var hourStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
    var monthStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
    var lunarStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);

    return SizedBox(
      child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Giờ ',
                    style: hourStyle,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Tháng ${_selectedDate.month}', style: monthStyle),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Âm lịch', style: lunarStyle),
                ],
              )
            ],
          )),
    );
  }

  onChangeMonth(DateTime newCalendar) {
    onDateTimeChanged(newCalendar);
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      getMainDate(),
    ]);
  }
}
