import 'package:app_lich_van_nien/components/horoscope/horoscopedetails/barheader.dart';
import 'package:app_lich_van_nien/data/models/tuviData.dart';
import 'package:app_lich_van_nien/data/repositories/mocks/api_connection_mock.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ContentDaily extends StatefulWidget {
  const ContentDaily({Key? key}) : super(key: key);

  @override
  State<ContentDaily> createState() => _ContentDailyState();
}

class _ContentDailyState extends State<ContentDaily> {
//  final List<String> items =;

  String? selectedGender;
  String? selectedBirth;
  List<dynamic> listbirthitem = List<String>.generate(90,(index) => "${(int.parse(DateFormat(DateFormat.YEAR).format(DateTime.now()))-100+index)}");
  List<TuviData> _tuviData = [];
  
  @override
  void dispose() {
    super.dispose();
    _getData();
    }

  _getData() async {
    var data = await loadTuviData();
    setState(() {
      _tuviData = data;
    }
    );
  }

  
  Widget getHeader() {

   
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: const [
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  'Giới tính',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: ['Nam', 'Nữ']
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value as String;
            });
          },
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 18,
          iconEnabledColor: Colors.white,
          buttonHeight: 50,
          buttonWidth: 160,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            border: Border.all(
                color: Colors.white, width: 1.0, style: BorderStyle.solid),
          ),
          buttonElevation: 2,
          itemHeight: 30,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 150,
          dropdownWidth: 150,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color.fromARGB(255, 231, 30, 30),
          ),
        ),
         DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: const [
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  'Năm sinh',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: listbirthitem
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedBirth,
          onChanged: (value) {
            setState(() {
              selectedBirth = value as String;
            });
          },
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 18,
          iconEnabledColor: Colors.white,
          buttonHeight: 50,
          buttonWidth: 160,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            border: Border.all(
                color: Colors.white, width: 1.0, style: BorderStyle.solid),
          ),
          buttonElevation: 2,
          itemHeight: 30,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 150,
          dropdownWidth: 150,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color.fromARGB(255, 231, 30, 30),
          ),
        ),
      ],
    );
  }

  Widget selectLunarDate() {
    var barStyle = const TextStyle(
      color: Colors.yellow,
      fontSize: 20,
    );
    return Column(
      children: <Widget>[
        Container(
            width: 500,
            height: 40,
            padding: const EdgeInsets.all(10),
            child: Text(
              'CHỌN THEO NĂM ÂM LỊCH',
              style: barStyle,
              textAlign: TextAlign.center,
            )),
      ],
    );
  }

  Widget paddingText(double top, String text, TextStyle style) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: 40, right: 30),
      child: Text(text, style: style), //truyền text và style vào ko bị cố định
    );
  }

  Widget getMainContent() {
    var styleText = const TextStyle(color: Colors.white, fontSize: 15);
    
    return Expanded(
      child: (Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 150.0, left: 8.0),
            child: Column(
              children: <Widget>[
               selectedBG(),
              ],
            ),
          ),
          getHeader(),
        ],
      )),
    );
  }

Widget selectedBG(){
    for (int i = 0; i < _tuviData.length; i++) {
      if(selectedBirth == selectedBirth) {
        if(selectedGender == selectedGender){      
        }
          
      }
    }
  return Column(
 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('ấgfasfasfgasf')
      ],
  );
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const BarHeaderDetails(),
        selectLunarDate(),
        getMainContent()
      ],
    );
  }
}

