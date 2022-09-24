import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsu/models/user.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';

class AlarmList extends StatefulWidget {
  const AlarmList({Key? key}) : super(key: key);

  @override
  State<AlarmList> createState() => _AlarmListState();
}

class _AlarmListState extends State<AlarmList> {
  List<Timer> _timer = [];
  final emergency_List = [
    // {"title": "76세 / 거동 불편 / 남성", "time": 9},
    // {"title": "65세 / 휠체어사용 / 남성", "time": 9},
    // {"title": "45세 / 시각 장애 / 여성", "time": 8},
    // {"title": "62세 / 거동 불편 / 여성", "time": 7 * 60},
    // {"title": "73세 / 치매 / 남성", "time": 5},
    // {"title": "76세 / 허리디스크 / 여성", "time": 3},
    // {"title": "60세 / 언어 장애 / 여성", "time": 2 * 60},
    // {"title": "76세 / 거동 불편 / 남성", "time": 1 * 60},
  ];

  @override
  void initState() {
    getResult(emergency_List);
    doTimer(_timer, emergency_List);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar("긴급 요청", kMainYellow, false),
        body: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.fromLTRB(10, 7, 5, 10),
            child: const Text.rich(
              TextSpan(
                text: ' 주의', // default text style
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: kMainRed,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: '  응답 후 10분 이내에 장소에 도착하지 않으면 자동 신고처리 됩니다.     ',
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: 13,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(0),
              itemCount: emergency_List.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 70,
                    padding: const EdgeInsets.fromLTRB(17, 3, 10, 3),
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
                                      text:
                                          '${emergency_List[index]["title"]!}', // default text style
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          "요청 종료까지 " +
                                              toMintues(emergency_List[index]
                                                  ["time"] as int) +
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
                              padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
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
          )
        ])));
  }

  void doTimer(List mytimer, List list) {
    for (var i = 0; i < list.length; i++) {
      mytimer.add(Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (list[i]['time'] > 0) {
            list[i]['time']--;
          } else {
            //타이머종료
            mytimer[i].cancel();
            //아이템 삭제
            list.removeAt(i);
          }
        });
      }));
    }
  }

  void getResult(List list) {
    User needer = User();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        //데이터만 보낼때
        needer.name = message.data['neederName'];
        needer.age = message.data['age'];
        needer.gender = message.data['gender'];
        // needer.time = message.data['reqTime'];
        setState(() {
          list.insert(0, {
            "title":
                "${needer.age}세 / ${message.data['detail']} / ${needer.gender}",
            "time": 10 * 60,
          });
          debugPrint(list.toString());
        });
      }
    });
  }

  String toMintues(int seconds) {
    String minutes = (seconds ~/ 60).toString();
    return minutes;
  }
}
