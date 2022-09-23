import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';

class HelpingPage extends StatelessWidget {
  const HelpingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('손수 중', kPrimaryColor),
      body: SafeArea(
          child: Column(
        children: [
          CircleAvatar(
            maxRadius: 60,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.asset('assets/images/needer.png'),
            ),
          ),
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
      )),
    );
  }
}
