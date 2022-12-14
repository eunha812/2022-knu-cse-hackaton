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
      {'label': 'μ§μ΄λ°π§³', 'selected': 'false'},
      {'label': 'κΈΈμλ΄ππ»ββοΈ', 'selected': 'false'},
      {'label': 'ν€μ€μ€ν¬π€', 'selected': 'false'},
      {'label': 'μ νΈλ±π¦', 'selected': 'false'},
      {'label': 'λμ€κ΅ν΅π', 'selected': 'false'},
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
                        "name": "μ΄μμ¬",
                        "age": "76μΈ",
                        "gender": "λ¨μ±"
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
              'λ²νΌμ λλ₯΄λ©΄\nλμμ λ°μ μ μμ΄μ!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.h),
            CircleButton(
              //λμ λ°κΈ°
              onPressed: () async {
                Get.toNamed('/match-try');
              },
              icon: Image.asset(
                'assets/images/hand.png',
                width: 90,
              ),
            ),
            SizedBox(height: 30.h),
            //ν€μλ λ§λ€κΈ°
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Wrap(
                direction: Axis.horizontal, // λμ΄ λ°©ν₯
                alignment: WrapAlignment.center, // μ λ ¬ λ°©μ
                spacing: 5, // μ’μ° κ°κ²©
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
