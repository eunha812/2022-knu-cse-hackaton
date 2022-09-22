import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';
import 'package:sonsu/widgets/rounded_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchCompletePage extends StatefulWidget {
  const MatchCompletePage({Key? key}) : super(key: key);

  @override
  State<MatchCompletePage> createState() => _MatchCompletePageState();
}

class _MatchCompletePageState extends State<MatchCompletePage> {
  late Timer _timer;
  int _timerCount = 60 * 10;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerCount > 0) {
          _timerCount--;
        } else {
          //타이머종료
          _timer.cancel();
          //신고후
          //뒤로가기
          Get.back();
        }
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('상세정보', kPrimaryColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 60,
                  backgroundColor: Colors.transparent,
                  child:
                      ClipOval(child: Image.asset('assets/images/helper.png')),
                ),
                SizedBox(width: 30.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '홍길동',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '남성',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '22세',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '신고횟수 0회',
                      style: TextStyle(
                        fontSize: 20,
                        color: kMainRed,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Text(
                timetoString(_timerCount),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.h),
              RoundedButton(
                onPressed: () {},
                label: '도움 시작',
                fontSize: 35,
                padding: EdgeInsets.all(50.w),
                radius: 50,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '헬퍼가 도착했다면\n버튼을 눌러주세요.',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                '(10분내로 도착하지 않으면\n자동으로 신고 및 취소가 됩니다.)',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String timetoString(int seconds) {
  Duration duration = Duration(minutes: seconds ~/ 60, seconds: seconds % 60);
  return formatDuration(duration);
}

String formatDuration(Duration duration) {
  String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return "$minutes:$seconds";
}
