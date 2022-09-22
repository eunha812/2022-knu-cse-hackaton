import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';

class HelperMain extends StatefulWidget {
  HelperMain({Key? key}) : super(key: key);

  @override
  State<HelperMain> createState() => _HelperMainState();
}

class _HelperMainState extends State<HelperMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMainGreen,
    );
  }
}
