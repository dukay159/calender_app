import 'package:app_lich_van_nien/components/horoscope/horoscopedetails/content_daily.dart';
import 'package:flutter/material.dart';

class Daily extends StatefulWidget {
  const Daily({
    Key? key,
  }) : super(key: key);

  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/hinh_nen.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 60),
              )),
          const ContentDaily(),
        ]),
      ),
    );
  }
  // new
}
