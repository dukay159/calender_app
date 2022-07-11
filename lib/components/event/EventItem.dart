// ignore_for_file: use_key_in_widget_constructors

import 'package:app_lich_van_nien/data/models/EventVO.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem(this.event);

  final EventVO event;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const contentStyle = TextStyle(color: Colors.white);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
     
            ),
                     child: Text('*${event.date.day}/${event.date.month} : ${event.event}', style: contentStyle),
          ),
        
        ],
      ),
    );
  }
}
