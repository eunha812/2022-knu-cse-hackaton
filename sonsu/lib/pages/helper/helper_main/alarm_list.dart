import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsu/models/user.dart';
import 'package:sonsu/services/api.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlarmList extends StatefulWidget {
  const AlarmList({Key? key}) : super(key: key);

  @override
  State<AlarmList> createState() => _AlarmListState();
}

class _AlarmListState extends State<AlarmList> {
  List<Timer> _timer = [];
  // final original_list = [];
  final emergency_List = [
    // {"name": "가나다","title": "76세 / 거동 불편 / 남성", "time": 9 * 60, "isCompleted": false},
    // {"name": "가나다","title": "65세 / 휠체어사용 / 남성", "time": 9 * 60, "isCompleted": false},
    // {"name": "가나다","title": "45세 / 시각 장애 / 여성", "time": 8 * 60, "isCompleted": false},
    // {"name": "가나다","title": "62세 / 거동 불편 / 여성", "time": 7 * 60, "isCompleted": false},
    // {"name": "가나다","title": "73세 / 치매 / 남성", "time": 5 * 60, "isCompleted": false},
    // {"name": "가나다","title": "76세 / 허리디스크 / 여성", "time": 3 * 60, "isCompleted": false},
    // {
    //   "name": "가나다",
    //   "title": "60세 / 언어 장애 / 여성",
    //   "time": 2 * 60,
    //   "isCompleted": false
    // },
    // {
    //   "name": "가나다",
    //   "title": "76세 / 거동 불편 / 남성",
    //   "time": 1 * 60,
    //   "isCompleted": false
    // },
  ];

  @override
  void initState() {
    getResult(emergency_List);
    // getList(original_list, emergency_List);
    doTimer(_timer, emergency_List);
    super.initState();
  }

  @override
  void dispose() {
    for (var i = 0; i < _timer.length; i++) {
      _timer[i].cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar("긴급 요청", Colors.white, kMainYellow, false),
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
                              child:
                                  Image.asset('assets/images/yellowhand.png'),
                            ),
                            onTap: emergency_List[index]["isCompleted"] as bool
                                ? null
                                : () {
                                    //도움 동의 묻기
                                    Get.defaultDialog(
                                        title: "도움의 손길을 내미시겠습니까?",
                                        titlePadding: EdgeInsets.fromLTRB(
                                            30.w, 15.w, 30.w, 5.w),
                                        contentPadding:
                                            EdgeInsets.only(bottom: 20.h),
                                        middleText: "동의 후 해당 위치로 꼭 이동해주세요!",
                                        textConfirm: "예",
                                        textCancel: "아니오",
                                        cancelTextColor: kMainYellow,
                                        confirmTextColor: Colors.white,
                                        buttonColor: kMainYellow,
                                        radius: 20,
                                        onConfirm: () {
                                          setState(() {
                                            emergency_List[index]
                                                ["isCompleted"] = true;
                                          });
                                          Get.back(); //dismiss dialog
                                          giveHelp(
                                              "정보석",
                                              emergency_List[index]["name"],
                                              context); //이름
                                          Get.toNamed('/needer_detail');
                                        });
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
      if (message.notification != null && message.data['detail'] != null) {
        //데이터만 보낼때
        needer.name = message.data['neederName'];
        needer.age = message.data['age'];
        needer.gender = message.data['gender'];
        // needer.time = message.data['reqTime'];
        if (!mounted) {
          return;
        }
        setState(() {
          //내림차순
          list.insert(0, {
            "name": needer.name,
            "title":
                "${needer.age}세 / ${message.data['detail']} / ${needer.gender}",
            "time": 10 * 60,
            "isCompleted": false,
          });
          // list.add({
          //   "name": needer.name,
          //   "title":
          //       "${needer.age}세 / ${message.data['detail']} / ${needer.gender}",
          //   "time": 10 * 60,
          //   "isCompleted": false,
          // });
        });
      }
    });
  }

  // void getList(List list1, List list2) async {
  //   ApiResponse apiResponse = await getNeedList();
  //   if (apiResponse.apiError == null) {
  //     list1 = apiResponse.data as List;
  //     debugPrint('이거임' + list1.toString());
  //     for (var i = 0; i < list1.length; i++) {
  //       list2.insert(0, {
  //         "name": list1[i]['neederName'],
  //         "title":
  //             "${list1[i]['age']}세 / ${list1[i]['detail']} / ${list1[i]['gender']}",
  //         "time": 10 * 60,
  //         "isCompleted": false,
  //       });
  //     }
  //   } else {
  //     print('리스트를 못가져옴');
  //   }
  // }

  String toMintues(int seconds) {
    String minutes = (seconds ~/ 60).toString();
    return minutes;
  }
}

void giveHelp(String who, String whohelp, BuildContext context) async {
  ApiResponse apiResponse = await sendHelpAccepted(who, whohelp);
  if (apiResponse.apiError == null) {
    Get.toNamed('/needer_detail');
  } else {
    const snackBar = SnackBar(
      content: Text(
        '죄송합니다 🥹 서버 오류가 발생하였습니다.',
        style: TextStyle(color: Colors.black),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
