// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabItem extends StatelessWidget {
  TabItem(
      {Key? key,
      required this.title,
      required this.image,
      required this.isSelected,
      required this.onPress})
      : super(key: key);
  final bool isSelected;
  final String title;
  final String image;
  final VoidCallback onPress;
  var unSelectColor = Colors.white30;
  var selectedColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    var iconColor = isSelected
        ? selectedColor
        : unSelectColor; //nếu đc chọn thì icon màu trắng còn ko thì màu xám
    var textStyle = TextStyle(
        color: isSelected
            ? selectedColor
            : unSelectColor, //nếu đc chọn thì icon màu trắng còn ko thì màu xám
        fontSize: 12);
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(image),
              width: 30,
              height: 30,
              color: iconColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(title, style: textStyle),
            )
          ],
        ),
      ),
    );
  }
}
