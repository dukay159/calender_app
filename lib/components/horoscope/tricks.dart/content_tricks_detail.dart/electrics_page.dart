import 'package:flutter/material.dart';

class ElectricsPage extends StatelessWidget {
  late String content; 
   ElectricsPage( {Key? key, required this.content}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    

    var contentStyle = const TextStyle(color: Colors.black, fontSize: 15);
    var titleStyle =
        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:16);
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.black,
      title: Padding(
        padding: const EdgeInsets.only(left: 45.0),
        child: Text('Dùng dấm lau đồ gỗ mới', style: titleStyle),
      ),
    ),
     body:  Padding(
       padding: const EdgeInsets.all(8.0),
      child: Text(content,style:contentStyle),
     )
    );
  }
}
