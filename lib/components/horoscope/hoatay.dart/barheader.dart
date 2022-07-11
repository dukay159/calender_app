import 'package:flutter/material.dart';

class BarHeaderHT extends StatelessWidget {
  const BarHeaderHT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

    return Material(
      child: Container(
        color: Colors.black,
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 25,
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text('XEM HOA TAY', style: titleStyle, textAlign: TextAlign.center),
            IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 30,
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
