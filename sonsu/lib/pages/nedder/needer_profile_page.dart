import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';

class NeederProfilePage extends StatelessWidget {
  const NeederProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('프로필', kPrimaryColor),
      body: SafeArea(
          child: Column(
        children: [
          //
        ],
      )),
    );
  }
}
