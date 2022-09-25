import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/rounded_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpOptionPage extends StatefulWidget {
  const SignUpOptionPage({super.key});

  @override
  State<SignUpOptionPage> createState() => _SignUpOptionPageState();
}

class _SignUpOptionPageState extends State<SignUpOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedButton(
                onPressed: () {
                  Get.toNamed('/helper-sign-up');
                },
                label: '도움\n주기',
                btnColor: kMainMiddleYellow,
                textColor: Colors.black,
                fontSize: 30.sp,
                padding: EdgeInsets.fromLTRB(40.w, 80.h, 40.w, 80.h),
                radius: 30.r,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(width: 20.w),
              RoundedButton(
                onPressed: () {
                  Get.toNamed('/needer-sign-up');
                },
                label: '도움\n받기',
                btnColor: kMainMiddleYellow,
                textColor: Colors.black,
                fontSize: 30.sp,
                padding: EdgeInsets.fromLTRB(40.w, 80.h, 40.w, 80.h),
                radius: 30.r,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
