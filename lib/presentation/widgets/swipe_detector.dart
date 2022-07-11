// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SwipeDetector extends StatelessWidget {
  @required
  SwipeDetector(
      {Key? key,
      required this.onSwipeLeft,
      required this.onSwipeRight,
      required this.child})
      : super(key: key);
  final Function onSwipeLeft;
  final Function onSwipeRight;
  final Widget child;
  var initialDrag = 0.0;
  var distanceDrag = 0.0;

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return GestureDetector(
      onPanStart: (details) {
        initialDrag = details.globalPosition.dx;
      },
      onPanUpdate: (DragUpdateDetails details) {
        distanceDrag = details.globalPosition.dx - initialDrag;
      },
      onPanEnd: (DragEndDetails details) {
        if (distanceDrag > 0) {
          // ignore: avoid_print
          print('swipe right');
          onSwipeLeft();
        }
        if (distanceDrag < 0) {
          // ignore: avoid_print
          print('swipe left');

          onSwipeRight();
        }
      },
      child: child,
    );
  }
}
