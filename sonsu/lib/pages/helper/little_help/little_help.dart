import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';
import 'package:sonsu/widgets/rounded_button.dart';

class LittleHelp extends StatefulWidget {
  const LittleHelp({Key? key}) : super(key: key);

  @override
  State<LittleHelp> createState() => _LittleHelpState();
}

class _LittleHelpState extends State<LittleHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar("소소한 도움", kMainYellow, false),
        body: Container(
          height: 70,
          child: Row(children: [
            Flexible(
                flex: 5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("please kill bug!!",
                          style: TextStyle(fontSize: 20.0),
                          textAlign: TextAlign.left),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("세은짱",
                              style: TextStyle(fontSize: 10.0),
                              textAlign: TextAlign.left),
                          Text("2022.09.25",
                              style: TextStyle(fontSize: 10.0),
                              textAlign: TextAlign.right)
                        ],
                      )
                    ])),
            Flexible(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: RoundedButton(
                      onPressed: () {},
                      label: "도움",
                      btnColor: Colors.black38,
                      textColor: Colors.white,
                      radius: 13,
                      elevation: 0,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    ))),
          ]),
        ));
  }
}
