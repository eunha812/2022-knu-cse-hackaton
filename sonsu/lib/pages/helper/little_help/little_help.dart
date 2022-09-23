import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';

class LittleHelp extends StatefulWidget {
  LittleHelp({Key? key}) : super(key: key);

  @override
  State<LittleHelp> createState() => _LittleHelpState();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar("소소한 도움", kMainYellow),
        body: Container(
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              Column(children: <Widget>[
                Text(
                  "please kill bug!!",
                  style: TextStyle(fontSize: 20.0),
                ),
              ]),
              Column(children: <Widget>[
                Row(
                  children: [Text("tpdms", style: TextStyle(fontSize: 20.0))],
                )
              ])
            ]),
            Row(
              children: <Widget>[
                Text("help", style: TextStyle(fontSize: 20.0))
              ],
            )
          ]),
        ));
  }
}

class _LittleHelpState extends State<LittleHelp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMainRed,
    );
  }
}
