import 'package:app_lich_van_nien/components/horoscope/tricks.dart/content_tricks_detail.dart/electrics_page.dart';
import 'package:app_lich_van_nien/components/horoscope/tricks.dart/content_tricks_detail.dart/housewares_page.dart';
import 'package:app_lich_van_nien/data/models/electricsData.dart';
import 'package:app_lich_van_nien/data/models/electricswareData.dart';
import 'package:app_lich_van_nien/data/models/housewareData.dart';
import 'package:app_lich_van_nien/data/models/impletmentData.dart';
import 'package:app_lich_van_nien/data/repositories/mocks/api_connection_mock.dart';
import 'package:flutter/material.dart';

class ContentTricks extends StatefulWidget {
  const ContentTricks({Key? key}) : super(key: key);

  @override
  State<ContentTricks> createState() => _ContentTricksState();
}

class _ContentTricksState extends State<ContentTricks> {
  List<ImplementData> produce = [];
  List<HousewareData> houseware = [];
  List<ElectricsData> produceElectrics = [];
  List<ElectricswareData> electricsware = [];

  late int index;
  @override
  void initState() {
    super.initState();
    _getData1();
    _getData2();
    _getData4();
    _getData();
  }

  //ImplementData
  _getData1() async {
    var data = await loadImplementData();
    setState(() {
      produce = data;
    });
  }

  //HousewareData
  _getData2() async {
    var data = await loadHousewareData();
    setState(() {
      houseware = data;
    });
  }

  _getData() async {
    var data = await loadElectricswareData();
    setState(() {
      electricsware = data;
    });
  }

  _getData4() async {
    var data = await loadElectrics();
    setState(() {
      produceElectrics = data;
    });
  }

  var topStyle = const TextStyle(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

  Widget getMainMeoVat() {
    var titleStyle = const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.only(left: 55.0),
            child: Text('MẸO VẶT CUỘC SỐNG', style: titleStyle),
          ),
          bottom: const TabBar(
            labelColor: Color.fromARGB(255, 242, 255, 67),
            unselectedLabelColor: Color.fromARGB(255, 199, 159, 156),
            unselectedLabelStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w700,
            ),
            tabs: <Widget>[
              Text('ĐỒ DÙNG'),
              Text('ĐỒ ĐIỆN'),
              Text('HOA QUẢ'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
//ĐỒ DÙNG
            ListView.separated(
              itemCount: produce.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                final contentproduce = produce[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HousewarePage(content: houseware[index].content)),
                    );
                  },
                  child: Card(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset("assets/images/dodung.jpg")
                              //(hà cc.mảng có gtri index).
                              ),
                          Text(
                            contentproduce.content,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_right),
                            iconSize: 30,
                            color: Colors.black,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ElectricsPage(
                                        content: electricsware[index].content)),
                              );
                            },
                          ),
                        ]),
                  ),
                );
              },
            ),
//ĐỒ ĐIỆN
            ListView.separated(
              itemCount: produceElectrics.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                final contentproduce = produceElectrics[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ElectricsPage(
                              content: electricsware[index].content)),
                    );
                  },
                  child: Card(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset("assets/images/dodien.jpg")
                              //(hà cc.mảng có gtri index).
                              ),
                          Text(
                            contentproduce.content,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_right),
                            iconSize: 30,
                            color: Colors.black,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ElectricsPage(
                                        content: electricsware[index].content)),
                              );
                            },
                          ),
                        ]),
                  ),
                );
              },
            ),
           ListView.separated(
              itemCount: produceElectrics.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                final contentproduce = produceElectrics[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ElectricsPage(
                              content: electricsware[index].content)),
                    );
                  },
                  child: Card(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset("assets/images/hoaqua.jpg")
                              //(hà cc.mảng có gtri index).
                              ),
                          Text(
                            contentproduce.content,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_right),
                            iconSize: 30,
                            color: Colors.black,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ElectricsPage(
                                        content: electricsware[index].content)),
                              );
                            },
                          ),
                        ]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: getMainMeoVat(),
    );
  }
}
