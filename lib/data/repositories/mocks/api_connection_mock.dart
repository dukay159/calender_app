import 'package:app_lich_van_nien/data/models/EventVO.dart';
import 'package:app_lich_van_nien/data/models/QuoteVO.dart';
import 'package:app_lich_van_nien/data/models/electricsData.dart';
import 'package:app_lich_van_nien/data/models/electricswareData.dart';
import 'package:app_lich_van_nien/data/models/housewareData.dart';
import 'package:app_lich_van_nien/data/models/impletmentData.dart';
import 'package:app_lich_van_nien/data/models/tuviData.dart';
import 'package:app_lich_van_nien/data/models/weatherLocationsData.dart';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAssets(name) async {
  return await rootBundle.loadString(name);
}

//get content thơ + tác giả
Future<List<QuoteVO>> loadQuoteData() async {
  var jsonString = await loadAssets('assets/json/quotes.json');
  List<QuoteVO> results = [];
  List jsonData = jsonDecode(jsonString);
  for (var element in jsonData) {
    String content = element['content'];
    String author = element['author'];
    QuoteVO quote = QuoteVO(content, author);
    results.add(quote);
  }
  return results;
}

//get sự kiện
Future<List<EventVO>> loadEventData() async {
  var jsonString = await loadAssets('assets/json/events.json');
  List<EventVO> results = [];
  List jsonData = jsonDecode(jsonString);
  for (var element in jsonData) {
    String dateString = element['date'];
    String name = element['name'];
    var dateArr = dateString.split("/");
    var date = DateTime(1993, int.parse(dateArr[1]), int.parse(dateArr[0]));
    EventVO event = EventVO(date, name);
    results.add(event);
  }
  return results;
}

Future<List<WeatherLocations>> loadLocationData() async {
  var jsonString = await loadAssets('assets/json/locations.json');
  List<WeatherLocations> results = [];
  List jsonData = jsonDecode(jsonString);
  for (var element in jsonData) {
    String city = element['city'];
    String temperature = element['temperature'];
    String weatherType = element['weatherType'];
    String iconUrl = element['iconUrl'];
    int wind = element['wind'];
    int rain = element['rain'];
    int humidity = element['humidity'];
    WeatherLocations locationList = WeatherLocations(
        city, temperature, weatherType, iconUrl, wind, rain, humidity);
    results.add(locationList);
  }
  return results;
}

Future<List<TuviData>> loadTuviData() async {
  var jsonString = await loadAssets('assets/json/tuvi.json');
  List<TuviData> results = [];
  List jsonData = jsonDecode(jsonString);
  for (var element in jsonData) {
    String gender = element['gender'];
    String age = element['age'];
    String content = element['content'];
    String lunarAge = element['lunar_age'];

    TuviData tuvi = TuviData(gender, age, content, lunarAge);
    results.add(tuvi);
  }

  return results;
}

Future<List<ImplementData>> loadImplementData() async {
  var jsonString = await loadAssets('assets/json/produce.json');
  List<ImplementData> results = [];
  List jsonData = jsonDecode(jsonString);
  for (var element in jsonData) {
    String iconUrl = element['iconUrl'];
    String content = element['content'];

    ImplementData produceImplementData = ImplementData(iconUrl, content);
    results.add(produceImplementData);
  }

  return results;
}

Future<List<HousewareData>> loadHousewareData() async {
  var jsonString = await loadAssets('assets/json/houseware.json');
  List<HousewareData> results = [];
  List jsonData = jsonDecode(jsonString);
  for (var element in jsonData) {
    String content = element['content'];
    HousewareData houseware = HousewareData(content);
    results.add(houseware);
  }

  return results;
}

Future<List<ElectricsData>> loadElectrics() async {
  var jsonString = await loadAssets('assets/json/electrics.json');
  List<ElectricsData> results = [];
  List jsonData = jsonDecode(jsonString);
  for (var element in jsonData) {
    String iconUrl = element['iconUrl'];
    String content = element['content'];

    ElectricsData produceElectrics = ElectricsData(iconUrl, content);
    results.add(produceElectrics);
  }

  return results;
}


Future<List<ElectricswareData>> loadElectricswareData() async {
  var jsonString = await loadAssets('assets/json/electricsware.json');
  List<ElectricswareData> results = [];
  List jsonData = jsonDecode(jsonString);
  for (var element in jsonData) {
    String content = element['content'];
    ElectricswareData electricsware = ElectricswareData(content);
    results.add(electricsware);
  }

  return results;
}