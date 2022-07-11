// ignore_for_file: file_names

import 'package:app_lich_van_nien/data/models/EventVO.dart';
import 'package:flutter/material.dart';
import 'EventItem.dart';

class EventList extends StatelessWidget {
  EventList({required this.data});
  final List<EventVO> data;

  Widget renderItem(EventVO event) {
    return EventItem(event);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 5000,
        color: Colors.black.withOpacity(0.5),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return renderItem(data[index]);
          },
        ),
      ),
    );
  }
}
