import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';

class HelpingList extends StatefulWidget {
  const HelpingList({Key? key}) : super(key: key);

  @override
  State<HelpingList> createState() => _HelpingListState();
}

class _HelpingListState extends State<HelpingList> {
  final littleList = [
    {
      "title": "짐 운반 도움",
      "name": "정보석",
      "time": "2022.09.25. 14:33",
      "res": "false"
    },
    {
      "title": "대중교통 탑승 도움",
      "name": "신세경",
      "time": "2022.09.25. 12:09",
      "res": "false"
    },
    {
      "title": "키오스크 사용 도움",
      "name": "빵꾸똥꾸",
      "time": "2022.09.24. 10:46",
      "res": "false"
    },
    {
      "title": "대중교통 탑승 도움",
      "name": "정보석",
      "time": "2022.09.23. 18:30",
      "res": "false"
    },
    {
      "title": "짐 운반 도움",
      "name": "나무니",
      "time": "2022.09.23. 14:23",
      "res": "false"
    },
    {
      "title": "대중교통 탑승 도움",
      "name": "이광수",
      "time": "2022.09.22. 09:45",
      "res": "false"
    },
    {
      "title": "대중교통 탑승 도움",
      "name": "유인나",
      "time": "2022.09.21. 09:30",
      "res": "false"
    },
    {
      "title": "키오스크 사용 도움",
      "name": "신세경",
      "time": "2022.09.20. 10:46",
      "res": "false"
    },
    {
      "title": "키오스크 사용 도움",
      "name": "줄리엔",
      "time": "2022.09.20. 10:46",
      "res": "false"
    },
    {
      "title": "키오스크 사용 도움",
      "name": "진지희",
      "time": "2022.09.24. 10:46",
      "res": "false"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar("도움 받은 기록", kPrimaryColor, true),
        body: ListView.separated(
          padding: EdgeInsets.all(0),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 70,
              padding: EdgeInsets.fromLTRB(18, 0, 15, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              littleList[index]["title"]!,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: kBlack,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                  child: Text(littleList[index]["name"]!,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.black38,
                                      )),
                                ),
                                Text(littleList[index]["time"]!,
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.black38))
                              ],
                            )
                          ]),
                    ),
                  ]),
            );
          },
          separatorBuilder: (BuildContext ctx, int idx) {
            return Divider();
          },
        ));
  }
}
