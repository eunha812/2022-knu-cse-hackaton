import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';
import 'package:sonsu/widgets/rounded_button.dart';

class LittleHelp extends StatefulWidget {
  const LittleHelp({Key? key}) : super(key: key);

  @override
  State<LittleHelp> createState() => _LittleHelpState();
}

class _LittleHelpState extends State<LittleHelp> {
  final littleList = [
    {
      "title": "캐리어 같이 들어주실분,,,",
      "name": "백설공주",
      "time": "2022.09.25. 14:33",
    },
    {"title": "잃어버린 우리집 냥이 찾아요ㅠ", "name": "오동이집사", "time": "2022.09.25. 10:09"},
    {"title": "감자털이 도와주세요^_ㅠ", "name": "감자국", "time": "2022.09.24. 22:30"},
    {
      "title": "다리 깁스 중인 학생입니다..",
      "name": "서울대 24학번",
      "time": "2022.09.24. 16:50"
    },
    {"title": "O형이신 분들 꼭 읽어주세요", "name": "익명이", "time": "2022.09.24. 11:46"},
    {
      "title": "자취방 이사 도와주실 분 구합니다!!(경대 쪽문)",
      "name": "컴학멋쟁이",
      "time": "2022.09.24. 08:53"
    },
    {"title": "(급함)컴퓨터 조립 도와주세요..", "name": "컴맹", "time": "2022.09.23. 23:30"},
    {
      "title": "오늘 점심 때 쪽문 맘스터치 가신 분들",
      "name": "싸이버거",
      "time": "2022.09.23. 15:20"
    },
    {
      "title": "혼밥 탈출 도와주실 분 계신가용?",
      "name": "ENFP",
      "time": "2022.09.23. 11:30"
    },
    {"title": "택시메이트 구합니다!", "name": "슬픈통학러", "time": "2022.09.23. 00:27"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar("소소한 도움", kMainYellow, false),
        body: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 70,
                padding: EdgeInsets.fromLTRB(35, 3, 10, 3),
                child: Row(children: [
                  Flexible(
                      flex: 4,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(littleList[index]["title"]!,
                                style:
                                    TextStyle(fontSize: 15.0, color: kBlack)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(littleList[index]["name"]!,
                                    style: TextStyle(
                                        fontSize: 11.0, color: Colors.black38)),
                                Text(littleList[index]["time"]!,
                                    style: TextStyle(
                                        fontSize: 11.0, color: Colors.black38))
                              ],
                            )
                          ])),
                  Flexible(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: RoundedButton(
                            onPressed: () {},
                            label: "     도 움     ",
                            btnColor: Colors.black38,
                            textColor: Colors.white,
                            radius: 10,
                            elevation: 0,
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            fontSize: 15,
                          ))),
                ]),
              );
            }));
  }
}
