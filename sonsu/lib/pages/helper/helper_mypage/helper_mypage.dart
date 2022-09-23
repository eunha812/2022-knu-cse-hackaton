import 'package:flutter/material.dart';
import 'package:sonsu/pages/helper/helper_mypage/helper_mypage_content.dart';
import 'package:sonsu/utils/constants.dart';

import '../../../widgets/app_bar.dart';

class HelperMypage extends StatefulWidget {
  HelperMypage({Key? key}) : super(key: key);

  @override
  State<HelperMypage> createState() => _HelperMypageState();
}

class _HelperMypageState extends State<HelperMypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar("프로필", kMainYellow, false),
      body: HelperMypageContent(),
    );
  }
}
