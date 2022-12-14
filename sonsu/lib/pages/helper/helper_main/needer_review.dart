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
      {'label': 'μ§μ΄λ°π§³', 'selected': 'false'},
      {'label': 'κΈΈμλ΄ππ»ββοΈ', 'selected': 'false'},
      {'label': 'ν€μ€μ€ν¬π€', 'selected': 'false'},
      {'label': 'μ νΈλ±π¦', 'selected': 'false'},
      {'label': 'λμ€κ΅ν΅π', 'selected': 'false'},
      {'label': 'κΈ°ν', 'selected': 'false'},
    ];

    return Scaffold(
      appBar: buildAppbar('λμ νκΈ°', Colors.white, kMainYellow, true),
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
                  // "μ΄μμ¬",
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
                      // "12μΈ",
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
                      // "λ¨μ±",
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
                  "κ±°λ λΆνΈ",
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
                  'β¨ μ΄λ€ λμμ μ£Όμ¨λμ?',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Wrap(
                    direction: Axis.horizontal, // λμ΄ λ°©ν₯
                    alignment: WrapAlignment.center, // μ λ ¬ λ°©μ
                    spacing: 10, // μ’μ° κ°κ²©
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
                          label: "μ μΆ",
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
