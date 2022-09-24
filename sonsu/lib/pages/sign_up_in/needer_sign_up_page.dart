import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:sonsu/widgets/rounded_button.dart';

class NeederSignUpPage extends StatefulWidget {
  NeederSignUpPage({Key? key}) : super(key: key);

  @override
  State<NeederSignUpPage> createState() => _NeederSignUpPageState();
}

class _NeederSignUpPageState extends State<NeederSignUpPage> {
  var profileImage;

  String _sex = '남성';
  final List<String> _sexList = ['남성', '여성'];
  String _age = '14세';
  final List<String> _ageList = [
    '14세',
    '15세',
    '16세',
    '17세',
    '18세',
    '19세',
    '20세',
    '21세',
    '22세',
    '23세',
    '24세',
    '25세',
    '26세',
    '27세',
    '28세',
    '29세',
    '30세',
    '31세',
    '32세',
    '33세',
    '34세',
    '35세',
    '36세',
    '37세',
    '38세',
    '39세',
    '40세',
    '41세',
    '42세',
    '43세',
    '44세',
    '45세',
    '46세',
    '47세',
    '48세',
    '49세',
    '50세',
    '51세',
    '52세',
    '53세',
    '54세',
    '55세',
    '56세',
    '57세',
    '58세',
    '59세',
    '60세',
    '61세',
    '62세',
    '63세',
    '64세',
    '65세',
    '66세',
    '67세',
    '68세',
    '69세',
    '70세',
    '71세',
    '72세',
    '73세',
    '74세',
    '75세',
    '76세',
    '77세',
    '78세',
    '79세',
    '80세',
    '81세',
    '82세',
    '83세',
    '84세',
    '85세',
    '86세',
    '87세',
    '88세',
    '89세',
    '90세',
    '91세',
    '92세',
    '93세',
    '94세',
    '95세',
    '96세',
    '97세',
    '98세',
    '99세',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '회원가입',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              _titleText('프로필 사진'),
              SizedBox(
                height: 6,
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  var picker = ImagePicker();
                  var image =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      profileImage = File(image.path);
                    });
                  }
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: profileImage == null
                        ? Image.asset(
                            'assets/images/default_profile.png',
                            fit: BoxFit.fitHeight,
                          )
                        : Image.file(
                            profileImage,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                '사진을 눌러 변경하세요.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              _titleText('아이디'),
              SizedBox(
                height: 6,
              ),
              _inputField("ID", false, 13),
              _titleText('비밀번호'),
              SizedBox(
                height: 6,
              ),
              _inputField("PASSWORD", true, 13),
              _titleText('비밀번호 확인'),
              SizedBox(
                height: 6,
              ),
              _inputField("PASSWORD CHECK", true, 13),
              _titleText('이름'),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 160),
                child: _inputField("NAME", false, 13),
              ),
              _titleText('성별'),
              SizedBox(
                height: 6,
              ),
              Container(
                height: 40,
                width: 150,
                margin: EdgeInsets.only(bottom: 20),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 25.r,
                        offset: Offset(0.w, 5.h),
                        spreadRadius: -25,
                      ),
                    ],
                  ),
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      value: _sex,
                      items: _sexList.map((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: ((String? value) {
                        setState(() {
                          _sex = value!;
                        });
                      }),
                      icon: Icon(Icons.arrow_drop_down_rounded),
                      iconEnabledColor: kMainYellow,
                      isExpanded: true,
                      underline: Container(),
                      style: TextStyle(fontSize: 13, color: Colors.black),
                      //dropdownColor: Colors.white,
                    ),
                  ),
                ),
              ),
              _titleText('나이'),
              SizedBox(
                height: 6,
              ),
              Container(
                height: 40,
                width: 150,
                margin: EdgeInsets.only(bottom: 20),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 25.r,
                        offset: Offset(0.w, 5.h),
                        spreadRadius: -25,
                      ),
                    ],
                  ),
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      value: _age,
                      items: _ageList.map((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: ((String? value) {
                        setState(() {
                          _age = value!;
                        });
                      }),
                      icon: Icon(Icons.arrow_drop_down_rounded),
                      iconEnabledColor: kMainYellow,
                      isExpanded: true,
                      underline: Container(),
                      style: TextStyle(fontSize: 13, color: Colors.black),
                      //dropdownColor: Colors.white,
                    ),
                  ),
                ),
              ),
              _titleText('특이사항'),
              SizedBox(
                height: 6,
              ),
              _inputField("SPECIAL NOTE", false, 13),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: RoundedButton(
                  onPressed: () {
                    Get.toNamed('/needer-home');
                  },
                  label: '회원가입',
                  padding: EdgeInsets.symmetric(vertical: 10),
                  btnColor: kMainGreen,
                  fontSize: 15,
                  radius: 30,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

Widget _titleText(String title) {
  return Text(
    title,
    style: TextStyle(
        color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
  );
}

Widget _inputField(String hintText, bool isPassword, double? fontSize) {
  return Container(
    height: 40,
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
      obscureText: isPassword,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: const Color(0xff000912),
      ),
      decoration: InputDecoration(
        //contentPadding: EdgeInsets.all(10.w),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
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
