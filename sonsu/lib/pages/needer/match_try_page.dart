import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchTryPage extends StatefulWidget {
  const MatchTryPage({Key? key}) : super(key: key);

  @override
  State<MatchTryPage> createState() => _MatchTryPageState();
}

class _MatchTryPageState extends State<MatchTryPage> {
  @override
  void initState() {
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
            FloatingActionButton(onPressed: () => getData(context)),
          ],
        ),
      ),
    );
  }
}

void getData(BuildContext context) {
  bool success = true; //디비에서 데이터 요청
  if (success) {
    Get.toNamed('match-complete',
        arguments: {"name": "김철수", "age": "22세", "gender": "남자"});
  } else {
    const snackBar = SnackBar(
      content: Text(
        '주변에 도움을 줄 사람이 없습니다. 다시 시도해보세요.',
        style: TextStyle(color: Colors.black),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.white70,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Get.back();
  }
}
