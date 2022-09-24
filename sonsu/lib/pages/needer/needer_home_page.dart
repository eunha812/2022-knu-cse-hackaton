import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsu/models/user.dart';
import 'package:sonsu/services/api.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonsu/widgets/circle_button.dart';
import 'package:sonsu/widgets/rounded_button.dart';

class NeederHomePage extends StatefulWidget {
  const NeederHomePage({Key? key}) : super(key: key);

  @override
  State<NeederHomePage> createState() => _NeederHomePageState();
}

class _NeederHomePageState extends State<NeederHomePage> {
  @override
  Widget build(BuildContext context) {
    var keywordList = [
      {'label': '짐운반🧳', 'selected': 'false'},
      {'label': '길안내💁🏻‍♀️', 'selected': 'false'},
      {'label': '키오스크🤖', 'selected': 'false'},
      {'label': '신호등🚦', 'selected': 'false'},
      {'label': '대중교통🚌', 'selected': 'false'},
    ];
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20.h, 20.w, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    iconSize: 35.w,
                    onPressed: () {
                      Get.toNamed('/needer-profile', arguments: {
                        "name": "김철수",
                        "age": "22세",
                        "gender": "남자"
                      });
                    },
                    icon: const Icon(
                      Icons.face_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            const Text(
              '버튼을 누르면\n도움을 받을 수 있어요!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.h),
            CircleButton(
              //도움 받기
              onPressed: () async {
                Get.toNamed('/match-try');
              },
              icon: Image.asset(
                'assets/images/hand.png',
                width: 90,
              ),
            ),
            SizedBox(height: 30.h),
            //키워드 만들기
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Wrap(
                direction: Axis.horizontal, // 나열 방향
                alignment: WrapAlignment.center, // 정렬 방식
                spacing: 5, // 좌우 간격
                runSpacing: 5,
                children: _buildKeyword(keywordList),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildKeyword(List list) {
    List<Widget> results = [];
    setState(() {
      for (var i = 0; i < list.length; i++) {
        results.add(RoundedButton(
          onPressed: () {
            setState(() {
              if (list[i]['selected'] == 'false') {
                list[i]['selected'] = 'true';
              } else {
                list[i]['selected'] = 'false';
              }
            });
          },
          label: list[i]['label'],
          btnColor: (list[i]['selected'] == 'true') ? kMainGreen : Colors.white,
          textColor: Colors.black,
          radius: 30,
        ));
      }
    });
    return results;
  }
}
