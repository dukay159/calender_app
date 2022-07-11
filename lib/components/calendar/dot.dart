// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot(this.isShow, this.color);
  final bool isShow;
  final Color color;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 6,
      height: 6,
      decoration:
          isShow ? BoxDecoration(color: color, shape: BoxShape.circle) : null,
    );
  }
}
