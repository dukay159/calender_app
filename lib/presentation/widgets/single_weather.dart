import 'package:app_lich_van_nien/core/utility.dart';

import 'package:app_lich_van_nien/data/models/weatherLocationsData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleWeather extends StatelessWidget {
  SingleWeather(this.index, this.locationList,{Key? key}) : super(key: key);
  final int index;
  final List<WeatherLocations> locationList;
  final _selectedDate = DateTime.now();
  
  @override
  Widget build(BuildContext context) {
    var dayOfWeek = getNameDayofWeekMonth(_selectedDate);
    
    var hourMinute = '${_selectedDate.hour} : ${_selectedDate.minute}';
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    Text(locationList[index].city,
                        style: GoogleFonts.lato(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    Text(
                        '$hourMinute - $dayOfWeek, ${_selectedDate.day}, Tháng ${_selectedDate.month}, ${_selectedDate.year}',
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          color: Colors.white,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(locationList[index].temparature,
                  style: GoogleFonts.lato(
                    fontSize: 100,
                    color: Colors.white,
                  )),
              Row(
                children: [
                  SvgPicture.asset(locationList[index].iconUrl,
                      width: 34, height: 34, color: Colors.white),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(locationList[index].weatherType,
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white30))),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Sức gió',
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: Colors.white,
                              )),
                          Text(locationList[index].wind.toString(),
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          Text('km/h',
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: Colors.white,
                              )),
                          Stack(children: [
                            Container(
                              height: 5,
                              width: 50,
                              color: Colors.white38,
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              color: const Color.fromARGB(255, 6, 138, 74),
                            )
                          ])
                        ],
                      ),
                      Column(
                        children: [
                          Text('Mưa',
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: Colors.white,
                              )),
                          Text(locationList[index].rain.toString(),
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          Text('%',
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: Colors.white,
                              )),
                          Stack(children: [
                            Container(
                              height: 5,
                              width: 50,
                              color: Colors.white38,
                            ),
                            Container(
                              height: 5,
                              width: 38,
                              color: Colors.redAccent,
                            )
                          ])
                        ],
                      ),
                      Column(
                        children: [
                          Text('Độ ẩm',
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: Colors.white,
                              )),
                          Text(locationList[index].humidity.toString(),
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                          Text('%',
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: Colors.white,
                              )),
                          Stack(children: [
                            Container(
                              height: 5,
                              width: 50,
                              color: Colors.white38,
                            ),
                            Container(
                              height: 5,
                              width: 28,
                              color: Colors.redAccent,
                            )
                          ])
                        ],
                      ),
                    ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
