// ignore_for_file: file_names, use_key_in_widget_constructors, duplicate_ignore

import 'package:app_lich_van_nien/data/models/TabItemData.dart';
import 'package:flutter/material.dart';

import 'TabItem.dart';

class BottomTab extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  @required
  const BottomTab(
      {required this.items,
      required this.currentIndex,
      required this.onTabTapped});
  final List<TabItemData> items; //  ds dữ liệu từ TabItemData
  final int currentIndex;
  final Function onTabTapped;
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var item in items) {
      var tabItem = TabItem(
        title: item.title,
        image: item.image,
        isSelected: item.index == currentIndex,
        onPress: () {
          onTabTapped(item.index);
        },
      );
      children.add(tabItem);
    }
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      height: 60,
      child: Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
        child: Row(children: children),
      ),
    );
  }
}
