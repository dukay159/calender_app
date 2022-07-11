import 'package:flutter/material.dart';

class BarHeader extends StatelessWidget {
  const BarHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

    return Container(
      color: Colors.black.withOpacity(0.8),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text('TỬ VI', style: titleStyle),
        ],
      ),
    );
  }
}
