import 'package:app_lich_van_nien/components/horoscope/hoatay.dart/barheader.dart';
import 'package:flutter/material.dart';

class ContentHoaTay extends StatefulWidget {
  const ContentHoaTay({Key? key}) : super(key: key);

  @override
  State<ContentHoaTay> createState() => _ContentHoaTayState();
}

class _ContentHoaTayState extends State<ContentHoaTay> {
//  final List<String> items =;

  var topStyle = const TextStyle(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

  Widget getMainHoatay() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              'Hoa tay của bạn có thể nói lên rất nhiều điều về tính cách và khả năng của bạn. Hãy thử xem bạn có bao nhiêu hoa tay!',
              style: topStyle),
        ),
        topicHoatay(),
      ],
    );
  }

  Widget topicHoatay() {
    var hoaTaysyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
    );
    var barHDstyle = const TextStyle(
        color: Colors.yellow, fontSize: 18, fontWeight: FontWeight.bold);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            height: 170,
            width: 380,
            child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 360,
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Text(
                            'Một hoa tay',
                            style: barHDstyle,
                            textAlign: TextAlign.center,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 7.0, right: 4.0),
                        child: Text(
                            '1 hoa tay bên trái thể hiện rằng bạn là người kiên định, tâm lý vững vàng, có chí lớn. Tuy nhiên, bạn thường hay cố chấp và chỉ muốn làm theo ý mình. Bạn có thể gặp phải khó khăn, nhưng sau khi thất bại thì bạn sẵn sàng bắt đầu lại. Bạn cũng là người yêu rất cuồng nhiệt.',
                            style: hoaTaysyle),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            height: 150,
            width: 380,
            child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 360,
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Text(
                            'Hai hoa tay',
                            style: barHDstyle,
                            textAlign: TextAlign.center,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 7.0, right: 4.0),
                        child: Text(
                            '2 hoa tay nằm trên cả 2 tay thì bạn là người có tính hiếu kỳ và phóng khoáng, thỉnh thoảng hơi vội vã khi làm việc.',
                            style: hoaTaysyle),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            height: 150,
            width: 380,
            child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 360,
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Text(
                            'Ba hoa tay',
                            style: barHDstyle,
                            textAlign: TextAlign.center,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 7.0, right: 4.0),
                        child: Text(
                            'Nằm trên cả 2 tay thể hiện bạn là người có tố chất toàn năng. Khi có cơ hội và thời gian, bạn có thể đảm đương bất kỳ thể loại công việc gì. Cảm tính và lý trí của bạn luôn cân bằng nên thường có vận mệnh tốt, hôn nhân lý tưởng.',
                            style: hoaTaysyle),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            height: 150,
            width: 380,
            child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 360,
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Text(
                            'Bốn hoa tay',
                            style: barHDstyle,
                            textAlign: TextAlign.center,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 7.0, right: 4.0),
                        child: Text(
                            'Cùng nằm trên 1 tay cho thấy rằng tính cách của bạn hướng theo chủ nghĩa hoàn mỹ, thích lấy mình làm trung tâm, thường xuyên gặp khó khăn trong yêu đương.',
                            style: hoaTaysyle),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            height: 150,
            width: 380,
            child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 360,
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Text(
                            'Năm hoa tay',
                            style: barHDstyle,
                            textAlign: TextAlign.center,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 7.0, right: 4.0),
                        child: Text(
                            'Cùng ở trên 1 bàn tay thì bạn thường là người có tính độc lập, mạnh mẽ, ít khi hài lòng với hiện tại nên gặp nhiều chuyện không như mong muốn.',
                            style: hoaTaysyle),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            height: 150,
            width: 380,
            child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 360,
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Text(
                            'Sáu hoa tay',
                            style: barHDstyle,
                            textAlign: TextAlign.center,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 7.0, right: 4.0),
                        child: Text(
                            'Tay trái nhiều hơn tay phải thể hiện rằng dã tâm của bạn lớn, thường xuyên suy nghĩ linh tinh, kì quái. Vận khí tốt dần lên sau thời niên thiếu và có yêu cầu rất mâu thuẫn với người khác giới.',
                            style: hoaTaysyle),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            height: 150,
            width: 380,
            child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 360,
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Text(
                            'Bảy hoa tay',
                            style: barHDstyle,
                            textAlign: TextAlign.center,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 7.0, right: 4.0),
                        child: Text(
                            'Số hoa tay ở tay trái nhiều hơn tay phải thể hiện bạn là người nội tâm, tính tình hơi khó chịu, luôn kiên trì và bền bỉ cho mục tiêu và có khả năng thành công cao trong tương lai.',
                            style: hoaTaysyle),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            height: 150,
            width: 380,
            child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 360,
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Text(
                            'Tám hoa tay',
                            style: barHDstyle,
                            textAlign: TextAlign.center,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 7.0, right: 4.0),
                        child: Text(
                            'Số hoa tay ở tay trái nhiều hơn tay phải nói rằng bạn là người khá hòa nhã, hay vui vẻ và u buồn tùy lúc. Bạn cũng hay để ý để đời tư người khác, tình cảm cá nhân khá phong phú và có cơ thể khỏe mạnh.',
                            style: hoaTaysyle),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            height: 150,
            width: 380,
            child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 360,
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Text(
                            'Chín hoa tay',
                            style: barHDstyle,
                            textAlign: TextAlign.center,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 7.0, right: 4.0),
                        child: Text(
                            'Số hoa tay ở tay trái nhiều hơn tay phải cho thấy tính cách bạn tích cực, sôi nổi, nhiệt tình, có khả năng ứng biến, lí giải và tổ chức hoạt động tốt',
                            style: hoaTaysyle),
                      ),
                    ],
                  ),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SizedBox(
            height: 150,
            width: 380,
            child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 360,
                          height: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                          ),
                          child: Text(
                            'Mười hoa tay',
                            style: barHDstyle,
                            textAlign: TextAlign.center,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 7.0, right: 4.0),
                        child: Text(
                            'Bạn là người rất lương thiện nhưng hơi cố chấp, bên ngoài trông bạn có vẻ rất mạnh mẽ, kiên cường nhưng thực chất bạn là người khá yếu đuối, nội tâm. Bạn là người si tình, vận khí của bạn tốt lên sau từ khi trung niên.',
                            style: hoaTaysyle),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const BarHeaderHT(),
        getMainHoatay(),
      ],
    );
  }
}
