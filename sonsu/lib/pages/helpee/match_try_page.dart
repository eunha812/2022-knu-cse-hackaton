import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonsu/widgets/circle_button.dart';

class MatchTryPage extends StatelessWidget {
  const MatchTryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  iconSize: 35.w,
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: kMainRed,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            '도움을 줄 사람을\n찾고 있어요!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          //로딩서클 만들기
        ],
      ),
    );
  }
}
