import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonsu/widgets/circle_button.dart';
import 'package:sonsu/widgets/rounded_button.dart';

class NeederReview extends StatelessWidget {
  const NeederReview({super.key});

  @override
  Widget build(BuildContext context) {
    var keywordList = [
      {'label': '짐운반🧳', 'selected': 'false'},
      {'label': '길안내💁🏻‍♀️', 'selected': 'false'},
      {'label': '키오스크🤖', 'selected': 'false'},
      {'label': '신호등🚦', 'selected': 'false'},
      {'label': '대중교통🚌', 'selected': 'false'},
      {'label': '기타', 'selected': 'false'},
    ];

    return Scaffold(
      appBar: buildAppbar('도움 후기', Colors.white, kMainYellow, true),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 360.w,
            padding: EdgeInsets.fromLTRB(0, 30.h, 0, 10.h),
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 50,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Image.asset('assets/images/soonjae.png'),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  '${Get.arguments['name']}',
                  // "이순재",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${Get.arguments['age']}',
                      // "12세",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      " / ",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      '${Get.arguments['gender']}',
                      // "남성",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  // '${Get.arguments['detail']}',
                  "거동 불편",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.h),
          Container(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(
              children: [
                Text(
                  '✨ 어떤 도움을 주셨나요?',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Wrap(
                    direction: Axis.horizontal, // 나열 방향
                    alignment: WrapAlignment.center, // 정렬 방식
                    spacing: 10, // 좌우 간격
                    children: _buildKeyword(keywordList),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10.h, 5.w, 50.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedButton(
                          onPressed: () {
                            Get.toNamed('alarm_list');
                          },
                          label: "제출",
                          btnColor: kMainDarkYellow,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  List<Widget> _buildKeyword(List list) {
    List<Widget> results = [];

    for (var i = 0; i < list.length; i++) {
      results.add(
        RoundedButton(
          onPressed: () {},
          label: list[i]['label'],
          btnColor: Colors.white,
          textColor: Colors.black,
          radius: 30,
        ),
      );
    }
    return results;
  }
}
