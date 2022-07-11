// ignore_for_file: use_key_in_widget_constructors

import 'package:app_lich_van_nien/components/calendar/constants.dart';
import 'package:flutter/material.dart';

class DayOfWeek extends StatelessWidget {
  const DayOfWeek(this.title, this.width);

  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
        Container(
          color: const Color.fromARGB(255, 219, 182, 182),
          width: width,
          height: 50,
          child: Center(
            child: Text(title.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: DOW_TEXT_SIZE,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
         
        ),
        );
  }
}
