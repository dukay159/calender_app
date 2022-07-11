import 'package:app_lich_van_nien/components/horoscope/hoatay.dart/content_hoatay.dart';
import 'package:flutter/material.dart';

class Hoatay extends StatefulWidget {
  const Hoatay({
    Key? key,
  }) : super(key: key);

  @override
  _HoatayState createState() => _HoatayState();
}

class _HoatayState extends State<Hoatay> {
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
          const SingleChildScrollView(
            child: ContentHoaTay(),
          ),
        ]),
      ),
    );
  }
  // new
}
