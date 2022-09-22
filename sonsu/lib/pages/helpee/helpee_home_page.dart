import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonsu/widgets/circle_button.dart';
import 'package:sonsu/widgets/rounded_button.dart';

class HelpeeHomePage extends StatelessWidget {
  const HelpeeHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> keywordList = [
      '짐운반🧳',
      '길안내💁🏻‍♀️',
      '키오스크🤖',
      '신호등🚦',
      '대중교통🚌'
    ];
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  iconSize: 35.w,
                  onPressed: () {
                    // Get.toNamed('/helpee-profile');
                  },
                  icon: const Icon(
                    Icons.face_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            '버튼을 누르면\n도움을 받을 수 있어요!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          CircleButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/hand.png',
              width: 90,
            ),
          ),
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
    );
  }
}

List<Widget> _buildKeyword(List list) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(RoundedButton(
      onPressed: () {},
      label: list[i],
      btnColor: Colors.white,
      textColor: Colors.black,
      radius: 30,
    ));
  }
  return results;
}
