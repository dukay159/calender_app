// ignore_for_file: must_call_super, no_logic_in_create_state, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:app_lich_van_nien/components/horoscope/barheader.dart';
import 'package:app_lich_van_nien/components/horoscope/hoatay.dart/hoatay.dart';
import 'package:app_lich_van_nien/components/horoscope/horoscopedetails/daily.dart';
import 'package:app_lich_van_nien/components/horoscope/tricks.dart/content_tricks.dart';



import 'package:flutter/material.dart';



class Horoscope extends StatefulWidget {
  const Horoscope({Key? key}) : super(key: key);

  @override
  State<Horoscope> createState() => _HoroscopeState();
}

class _HoroscopeState extends State<Horoscope> {
  //Viền ngăn cách giữa các cột
  Widget infoBox(Widget widget) {
    return Expanded(
      child: (Container(
        padding: const EdgeInsets.only(right: 10),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: widget,
      )),
    );
  }

  Widget forU() {
    var barStyle = const TextStyle(
        color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold);
    return Column(
      children: <Widget>[
        Container(
            width: 500,
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
            ),
            child: Text(
              'DÀNH CHO BẠN',
              style: barStyle,
              textAlign: TextAlign.center,
            )),
      ],
    );
  }

  Widget useOfForU() {
    var textStyle = const TextStyle(color: Colors.white, fontSize: 15);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  const Daily()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/tv1.jpg'),
                  ),
                  const Text(''),
                  Text('Tử Vi \nHàng Ngày',
                      style: textStyle, textAlign: TextAlign.center)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Hoatay()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/hoatay.jpeg'),
                  ),
                  const Text(''),
                  Text('Xem \n Hoa tay',
                      style: textStyle, textAlign: TextAlign.center)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
               Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ContentTricks()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/meovatcs.jpg'),
                  ),
                  const Text(''),
                  Text('Mẹo Vặt \n Cuộc Sống',
                      style: textStyle, textAlign: TextAlign.center)
                ],
              ),
            ),
          ),
        ]);
  }

  Widget useOfTuVi() {
    var textStyle = const TextStyle(color: Colors.white, fontSize: 15);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/lehoi.jpg'),
                ),
                const Text(''),
                Text('Lễ Hội \n',
                    style: textStyle, textAlign: TextAlign.center)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/xongdat.jpg'),
                ),
                const Text(''),
                Text('Truyện cười \n ',
                    style: textStyle, textAlign: TextAlign.center)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/meovatcs.jpg'),
                ),
                const Text(''),
                Text('Mẹo Vặt \n Cuộc Sống',
                    style: textStyle, textAlign: TextAlign.center)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/vochong.jpg'),
                ),
                const Text(''),
                Text('Xem Tuổi \n Vợ Chồng',
                    style: textStyle, textAlign: TextAlign.center)
              ],
            ),
          ),
        ]);
  }

  Widget tuvi() {
    var barStyle = const TextStyle(
        color: Colors.yellow, fontSize: 20, fontWeight: FontWeight.bold);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
              width: 500,
              height: 40,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
              ),
              child: Text(
                'TỬ VI - XEM TUỔI',
                style: barStyle,
                textAlign: TextAlign.center,
              )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const BarHeader(),
        forU(),
        useOfForU(),
        tuvi(),
        useOfTuVi()
      ],
    );
  }
}
