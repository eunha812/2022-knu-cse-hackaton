import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonsu/widgets/circle_button.dart';
import 'package:sonsu/widgets/rounded_button.dart';

class NeederProfilePage extends StatelessWidget {
  const NeederProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var keywordList = [
      {'label': 'μ§μ΄λ°π§³', 'selected': 'false'},
      // {'label': 'κΈΈμλ΄ππ»ββοΈ', 'selected': 'false'},
      {'label': 'ν€μ€μ€ν¬π€', 'selected': 'false'},
      // {'label': 'μ νΈλ±π¦', 'selected': 'false'},
      {'label': 'λμ€κ΅ν΅π', 'selected': 'false'},
    ];

    return Scaffold(
      appBar: buildAppbar('νλ‘ν', Colors.white, kPrimaryColor, true),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 360.w,
            color: Colors.grey[200],
            padding: EdgeInsets.fromLTRB(0, 55.h, 0, 10.h),
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 80,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Image.asset('assets/images/soonjae.png'),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  '${Get.arguments['name']}',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(90.w, 20.h, 90.w, 30.h),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'λμ΄',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      '${Get.arguments['age']}',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'μ±λ³',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      '${Get.arguments['gender']}',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'μ κ³ νμ',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kMainRed,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${Get.arguments['report'] ?? 0}ν',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: kMainRed,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            'μ΅κ·Ό μ΄λ° λμλ€μ λ°μμ΄μ - β¨',
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 5.h),
          Wrap(
            direction: Axis.horizontal, // λμ΄ λ°©ν₯
            alignment: WrapAlignment.center, // μ λ ¬ λ°©μ
            spacing: 5, // μ’μ° κ°κ²©
            children: _buildKeyword(keywordList),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 10.h, 5.w, 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleButton(
                    onPressed: () {
                      Get.toNamed('helping_list');
                    },
                    icon: Icon(
                      Icons.more_horiz_rounded,
                      size: 15.sp,
                    ),
                    padding: EdgeInsets.all(10.w),
                    elevation: 3,
                    backgroundColor: kMainYellow,
                  ),
                ],
              ))
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
