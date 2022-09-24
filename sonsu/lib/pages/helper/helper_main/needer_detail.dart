import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';

import '../../../widgets/app_bar.dart';

class NeederDetail extends StatefulWidget {
  const NeederDetail({Key? key}) : super(key: key);

  @override
  State<NeederDetail> createState() => _NeederDetailState();
}

class _NeederDetailState extends State<NeederDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar("상세정보", kMainYellow, false),
        body: (Container(
          child: Column(children: [
            Container(
              margin: EdgeInsets.all(30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 130,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/jewelry.png',
                          fit: BoxFit.fitHeight,
                        )),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '이순재',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '남성',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '76세',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '거동 불편',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        )));
  }
}
