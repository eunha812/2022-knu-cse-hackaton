import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';

class HelperMain extends StatefulWidget {
  const HelperMain({Key? key}) : super(key: key);

  @override
  State<HelperMain> createState() => _HelperMainState();
}

class _HelperMainState extends State<HelperMain> {
  final Images = [
    'assets/images/cardnews01.png',
    'assets/images/cardnews02.png',
    'assets/images/cardnews03.png',
    'assets/images/cardnews04.png',
    'assets/images/cardnews05.png',
  ];

  final GlobalKey _chartKey = new GlobalKey();

  final sosoList = [
    {
      "title": "캐리어 같이 들어주실분,,,",
      "time": "1분전",
    },
    {"title": "잃어버린 우리집 냥이 찾아요ㅠ", "time": "3분전"},
    {"title": "감자털이 도와주세요", "time": "10분전"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          //로고 및 알림버튼
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  child: Image.asset(
                    'assets/images/sonsu_text_logo.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  child: Container(
                    height: 30,
                    child: Image.asset(
                      'assets/images/new_alarm.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  onTap: () {
                    Get.toNamed('/alarm');
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          //레벨 및 도움 횟수
          Container(
            //width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '정보석님,',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '오늘도 손수 따뜻한 세상을 만들러 오셨군요!',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/my_record_bar.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          //소소한 도움 상위 게시글
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color.fromARGB(15, 0, 0, 0),
                width: 2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '소소한 도움',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: Text(
                          "more",
                          style: const TextStyle(
                              fontSize: 11, color: Color.fromARGB(90, 0, 0, 0)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                sosoList[index]["title"]!,
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                sosoList[index]["time"]!,
                                style: const TextStyle(
                                    fontSize: 10,
                                    color: Color.fromARGB(70, 0, 0, 0)),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.05,
          ),
          //카드뉴스 슬라이드
          CarouselSlider.builder(
            itemCount: Images.length,
            itemBuilder: ((context, index, realIndex) {
              final urlImage = Images[index];
              return Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    urlImage,
                  ),
                ),
              );
            }),
            options: CarouselOptions(
                height: Get.height * 0.31,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                viewportFraction: 0.4,
                autoPlay: true),
          ),
        ],
      ),
    );
  }
}
