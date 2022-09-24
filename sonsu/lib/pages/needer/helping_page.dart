import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';
import 'package:sonsu/widgets/circle_button.dart';
import 'package:sonsu/widgets/rounded_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpingPage extends StatelessWidget {
  const HelpingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('손수 중', Colors.white, kPrimaryColor, true),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60.h),
              const Text(
                '도움이 잘 끝났다면\n버튼을 눌러주세요.',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40.h),
              RoundedButton(
                onPressed: () {
                  // 잘끝났다는 알림이 뜨면서,, 히스토리로 이동,,,?
                  Get.toNamed('/needer-home');
                },
                label: '도움 완료',
                fontSize: 35,
                padding: EdgeInsets.all(50.w),
                radius: 50,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 80.h),
              CircleButton(
                onPressed: () {
                  //신고하기
                },
                icon: const Icon(
                  Icons.priority_high_rounded,
                  size: 40,
                ),
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 10.h),
              ),
              const Text(
                '신고하기',
                style: TextStyle(
                  fontSize: 20,
                  color: kMainRed,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.h),
              const Text(
                '문제가 생겼나요?\n그렇다면 신고버튼을 눌러보세요.',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
