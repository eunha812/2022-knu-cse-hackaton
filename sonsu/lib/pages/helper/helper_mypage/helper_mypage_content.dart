import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sonsu/utils/constants.dart';

import '../../../models/user.dart';
import '../../../services/api.dart';

class HelperMypageContent extends StatelessWidget {
  const HelperMypageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(30, 30, 0, 30),
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
                      '${Get.arguments['helperName']}',
                      // '정보석',

                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${Get.arguments['gender']}',
                      // '남성',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${Get.arguments['age']}',
                      // '38세',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '신고횟수       0회',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: kMainRed,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  child: Container(
                    height: 30,
                    margin: EdgeInsets.fromLTRB(70, 0, 0, 100),
                    child: Image.asset(
                      'assets/images/review.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  onTap: () {
                    Get.toNamed('/needer_review');
                  },
                )
              ],
            ),
          ),
          Container(
            height: 2.5,
            width: double.infinity,
            color: Color.fromARGB(10, 0, 0, 0),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: kMainYellow,
                      size: 25,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '나의 도움 기록',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '총 ${Get.arguments['report']}회',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            child: Image.asset(
              'assets/images/my_graph.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                child: Image.asset(
                  'assets/images/level01.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                height: 100,
                child: Image.asset(
                  'assets/images/level02.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                height: 100,
                child: Image.asset(
                  'assets/images/level03.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

