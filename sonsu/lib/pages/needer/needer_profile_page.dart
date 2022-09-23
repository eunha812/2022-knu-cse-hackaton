import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeederProfilePage extends StatelessWidget {
  const NeederProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('프로필', kPrimaryColor, true),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                maxRadius: 60,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset('assets/images/needer.png'),
                ),
              ),
              Text(
                '${Get.arguments['name']}',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${Get.arguments['age']}',
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
              const Text(
                '신고횟수 0회',
                style: TextStyle(
                  fontSize: 20,
                  color: kMainRed,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
