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
    name: "김철수",
    location: "[37.504198, 127.047967]",
    time: DateTime.now().toString(),
  );

  @override
  void initState() {
    sendNeed(user.name!, user.location!, user.time!, context);
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
