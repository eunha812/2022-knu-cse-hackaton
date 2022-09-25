import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsu/models/user.dart';
import 'package:sonsu/services/api.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewList extends StatefulWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  State<ReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  List<Timer> _timer = [];
  final emergency_List = [
    {
      "name": "가나다",
      "title": "60세 / 언어 장애 / 여성",
      "time": 10 * 60,
      "isCompleted": false
    },
    {
      "name": "가나다",
      "title": "76세 / 거동 불편 / 남성",
      "time": 1 * 60,
      "isCompleted": false
    },
  ];

  @override
  void initState() {
    getResult(emergency_List);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar("내가 내밀었던 손길들", Colors.white, kMainYellow, true),
        body: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.fromLTRB(10, 7, 5, 10),
            child: const Text.rich(
              TextSpan(
                text: ' 공지', // default text style
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: kMainRed,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text:
                          '   다음 손길을 위해 후기를 꼭 작성해주세요 :)                                                      ',
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
                                          fontWeight: FontWeight.w700),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '에게 도움을 주었어요.',
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              Get.toNamed('needer_review');
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                              height: 40,
                              child: Image.asset('assets/images/review.png'),
                            ),
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

  void getResult(List list) {
    User needer = User();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null && message.data['detail'] != null) {
        //데이터만 보낼때
        needer.name = message.data['neederName'];
        needer.age = message.data['age'];
        needer.gender = message.data['gender'];
        // needer.time = message.data['reqTime'];
        setState(() {
          list.insert(0, {
            "name": needer.name,
            "title":
                "${needer.age}세 / ${message.data['detail']} / ${needer.gender}",
            "time": 10 * 60,
            "isCompleted": false,
          });
        });
      }
    });
  }
}

void giveHelp(String who, String whohelp, BuildContext context) async {
  ApiResponse apiResponse = await sendHelpAccepted(who, whohelp);
  Get.back(); //dismiss dialog
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
