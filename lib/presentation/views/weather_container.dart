// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:app_lich_van_nien/data/models/weatherLocationsData.dart';
import 'package:app_lich_van_nien/data/repositories/mocks/api_connection_mock.dart';
import 'package:app_lich_van_nien/presentation/widgets/single_weather.dart';
import 'package:app_lich_van_nien/presentation/widgets/slider_dot.dart';
import 'package:flutter/material.dart';

class WeatherContainer extends StatefulWidget {
  const WeatherContainer({Key? key}) : super(key: key);

  @override
  State<WeatherContainer> createState() => _WeatherContainerState();
}

class _WeatherContainerState extends State<WeatherContainer> {
  List<WeatherLocations> locationList = [];
  int _currentPage = 0;
  late String bgImg;
 @override
  void initState() {
    super.initState();
    _getData();
 
    bgImg = 'assets/images/img_1.jpg';
  }
  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  var headerStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);

  Widget getWeatherHeader() {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.black.withOpacity(0.8),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.white,
                    )),
              ),
              Text('THỜI TIẾT', style: headerStyle),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.menu,
                      size: 20,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }

 _getData() async {
    var data = await loadLocationData();
    setState(() {
      locationList = data;
    });
  }
  Widget getMain(){
    switch(locationList[_currentPage].weatherType)
    {
      case 'Sunny': 
      bgImg = 'assets/images/img_3.jpg';
      break;
      case 'Night': 
      bgImg = 'assets/images/img_4.jpg';
      break;
      case 'Rainy': 
      bgImg = 'assets/images/img_2.jpg';
      break;
    }

    return Expanded(
      child: (Stack(
        children: <Widget>[
          Positioned.fill(
            //Widget Positioned được sử dụng để định vị cho một widget con của một Stack.
            child: Image(
              image: AssetImage(bgImg),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Stack(
                children: [
                  Container(
                      decoration: const BoxDecoration(color: Colors.black38)),
                  Container(
                      margin: const EdgeInsets.only(top: 100, left: 15),
                      child: Row(
                        children: [
                          for (int i = 0; i < locationList.length; i++)
                            if (i == _currentPage)
                              SliderDot(true)
                            else
                              SliderDot(false)
                        ],
                      )),
                  Scrollbar(//lướt trái phải
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      onPageChanged: _onPageChanged,
                      itemCount: locationList.length,
                      itemBuilder: (c, i) => SingleWeather(i,locationList),
                    ),
                  )
                ],
              )),
          getWeatherHeader(),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        getMain(),
      ],
    );
  }
}


//flutter run --no-sound-null-safety
