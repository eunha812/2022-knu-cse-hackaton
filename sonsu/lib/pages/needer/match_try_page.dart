import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsu/models/user.dart';
import 'package:sonsu/services/api.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchTryPage extends StatefulWidget {
  const MatchTryPage({Key? key}) : super(key: key);

  @override
  State<MatchTryPage> createState() => _MatchTryPageState();
}

class _MatchTryPageState extends State<MatchTryPage> {
  var user = User(
    //needer
    name: "김철수",
    location: "[37.504198, 127.047967]",
    time: DateTime.now().toString(),
  );
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      getResult(user, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
            SizedBox(height: 90.h),
            const Text(
              '도움을 줄 사람을\n찾고 있어요!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.h),
            //프로세스 만들기
            SizedBox(
              width: 100.w,
              height: 100.w,
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.white30,
                strokeWidth: 8.w,
                semanticsLabel: 'Circular progress indicator',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void getResult(User user, BuildContext context) async {
  var helper = User();
  ApiResponse apiResponse = await sendNeed(user.name!, user.location!, user.time!);
  if (apiResponse.apiError == null) {
    //helper 나타남!
    Get.snackbar(
      '매칭 결과',
      '당신을 도와줄 사람이 나타났어요 ~ 🥳',
      backgroundColor: Colors.white,
    );
    //helper 정보 노티 받고 화면 전환
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification == null) {
        helper.name = message.data['helperName'];
        helper.age = message.data['age'];
        helper.gender = message.data['gender'];
        helper.report = message.data['report'];
        helper.imgUrl = message.data['helperImg'];
        Get.toNamed('match-complete', arguments: helper);
      }
    });
  } else {
    const snackBar = SnackBar(
      content: Text(
        '주변에 도움을 줄 사람이 없습니다🥹 다시 시도해보세요!',
        style: TextStyle(color: Colors.black),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // Get.snackbar('매칭 결과', '주변에 도움을 줄 사람이 없습니다. 다시 시도해보세요!');
    Get.back();
  }
}
