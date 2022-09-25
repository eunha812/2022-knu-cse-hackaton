import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonsu/widgets/rounded_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  bool autoLogin = false;

  @override
  void initState() {
    // Future.delayed(Duration.zero, () async {
    //   if (autoLogin == true) {
    //     Get.toNamed('/needer-home');
    //   }
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(50.w, 80.h, 50.w, 0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 100.w,
                ),
              ),
              _inputField("아이디", false, 15.sp, idController),
              _inputField("비밀번호", true, 15.sp, pwController),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Checkbox(
                            value: autoLogin,
                            activeColor: kMainGreen,
                            onChanged: (bool? value) {
                              setState(() {
                                autoLogin = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '자동로그인',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Get.toNamed('/sign-up-option');
                      },
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              RoundedButton(
                onPressed: () {
                  if (idController.text.isNotEmpty &&
                      pwController.text.isNotEmpty) {
                    if (idController.text == "test1" &&
                        pwController.text == "1234") {
                      //needer
                      Get.toNamed('/needer-home');
                    } else if (idController.text == "test2" &&
                        pwController.text == "2345") {
                      //helper
                      Get.toNamed('/home');
                    }
                  }
                },
                label: '로그인',
                btnColor: kMainGreen,
                fontSize: 18.sp,
                padding: EdgeInsets.fromLTRB(100.w, 10.h, 100.w, 10.h),
                radius: 30.r,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

Widget _inputField(String hintText, bool isPassword, double? fontSize,
    TextEditingController controller) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(50.r),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 25.r,
          offset: Offset(0.w, 5.h),
          spreadRadius: -25,
        ),
      ],
    ),
    margin: EdgeInsets.only(bottom: 20.h),
    child: TextField(
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: const Color(0xff000912),
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.w),
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color(0xffA6B0BD),
        ),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50.r),
          ),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50.r),
          ),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    ),
  );
}
