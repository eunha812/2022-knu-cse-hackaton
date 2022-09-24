import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';
import 'package:sonsu/widgets/rounded_button.dart';

class AlarmList extends StatefulWidget {
  const AlarmList({Key? key}) : super(key: key);

  @override
  State<AlarmList> createState() => _AlarmListState();
}

class _AlarmListState extends State<AlarmList> {
  final emergency_List = [
    {"title": "76세 / 거동 불편 / 여성", "time": "9"},
    {"title": "65세 / 휠체어사용 / 남성", "time": "9"},
    {"title": "45세 / 시각 장애 / 여성", "time": "8"},
    {"title": "62세 / 거동 불편 / 남성", "time": "7"},
    {"title": "73세 / 치매 / 남성", "time": "5"},
    {"title": "76세 / 허리디스크 / 여성", "time": "3"},
    {"title": "60세 / 언어 장애 / 여성", "time": "2"},
    {"title": "76세 / 거동 불편 / 남성", "time": "1"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar("긴급 요청", kMainYellow, false),
      body: ListView.separated(
        padding: EdgeInsets.all(0),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 70,
              padding: EdgeInsets.fromLTRB(17, 3, 10, 3),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: emergency_List[index]
                                    ["title"]!, // default text style
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '이 도움을 요청합니다!',
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    "요청 종료까지 " +
                                        emergency_List[index]["time"]! +
                                        "분 남았습니다",
                                    style: TextStyle(
                                        fontSize: 11.0, color: kMainRed))
                              ],
                            )
                          ]),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        height: 30,
                        child: Image.asset(
                          'assets/images/yellowhand.png',
                        ),
                      ),
                      onTap: () {
                        Get.toNamed('/needer_detail');
                      },
                    )
                  ]));
        },
        separatorBuilder: (BuildContext ctx, int idx) {
          return Divider();
        },
      ),
    );
  }
}
