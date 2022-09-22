import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonsu/widgets/circle_button.dart';

class HelpeeHomePage extends StatelessWidget {
  const HelpeeHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 40.h, 20.w, 0),
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
          CircleButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/hand.png',
              width: 90,
            ),
          ),
        ],
      ),
    );
  }
}
