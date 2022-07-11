// ignore_for_file: unused_field, must_call_super, non_constant_identifier_names

// import 'package:app_lich_van_nien/components/calendar/calendar.dart';
// import 'package:app_lich_van_nien/data/models/EventVO.dart';
import 'package:app_lich_van_nien/components/calendar/calendar.dart';
import 'package:app_lich_van_nien/data/models/EventVO.dart';
import 'package:app_lich_van_nien/data/repositories/mocks/api_connection_mock.dart';
import 'package:flutter/material.dart';

class MonthContainer extends StatefulWidget {
  const MonthContainer({Key? key}) : super(key: key);

  @override
  State<MonthContainer> createState() => _MonthContainerState();
}

class _MonthContainerState extends State<MonthContainer> {
  final List<DateTime> _markedDates = [];
  List<EventVO> _eventData = [];
  late DateTime _calendar = DateTime.now();

  @override
  void initState() {
    super.initState();
    _getData();
  }

//get nội dung sự kiện
  _getData() async {
    var data = await loadEventData();
    setState(() {
      _eventData = data;
    });

    generate_markedDates();
  }

  generate_markedDates() {
    for (var event in _eventData) {
      // duyệt sự kiện trong mảng _eventData[]
      _markedDates.add(event.date); //thêm nội dung vào ngày nào có sự kiện
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/hinh_nen.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only( bottom: 65),
          child: SingleChildScrollView(
            child: Calendar(
              markedDays: _markedDates,
              onDateTimeChanged: (newDate) {
                setState(() {
                  _calendar = newDate;
                });
              },
            ),
          ),
        ));
  }
}
