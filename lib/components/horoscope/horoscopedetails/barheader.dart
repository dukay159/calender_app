import 'package:flutter/material.dart';

class BarHeaderDetails extends StatelessWidget {
  const BarHeaderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

    return Material(
      child: Container(
        color: Colors.black.withOpacity(0.9),
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
            const Text('TỬ VI 2022', style: titleStyle),
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
