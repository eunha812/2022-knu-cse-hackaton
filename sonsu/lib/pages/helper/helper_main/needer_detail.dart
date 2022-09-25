import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../widgets/app_bar.dart';
import '../../../widgets/circle_button.dart';

class NeederDetail extends StatefulWidget {
  const NeederDetail({Key? key}) : super(key: key);

  @override
  State<NeederDetail> createState() => _NeederDetailState();
}

class _NeederDetailState extends State<NeederDetail> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.86477855860554, 128.59331884318206),
    zoom: 14.4746,
  );

  final needList = [
    {
      "title": "대중교통 탑승 도움",
      "time": "1일 전",
    },
    {"title": "키오스크 사용 도움", "time": "1일 전"},
    {"title": "대중교통 탑승 도움", "time": "3일 전"},
  ];
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _markers.add(Marker(
        markerId: MarkerId("1"),
        draggable: true,
        onTap: () => print("반월당역 1번 출구"),
        position: LatLng(35.86477855860554, 128.59331884318206)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppbar("상세정보", Colors.white, kMainYellow, true),
        body: (Container(
            child: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            margin: EdgeInsets.fromLTRB(30, 0, 0, 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  height: 130,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'assets/images/soonjae.png',
                        fit: BoxFit.fitHeight,
                      )),
                ),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        '나이: 76세',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        '성별: 남성',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        '특이사항: 거동 불편',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        ' ',
                        style: TextStyle(
                          fontSize: 8,
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        '                                      🚨신고하기',
                        style: TextStyle(
                          fontSize: 15,
                          color: kMainRed,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 8.0,
            width: double.infinity,
            color: Color.fromARGB(10, 0, 0, 0),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '최근 요청 기록',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 55,
                  child: ListView.builder(
                      padding: EdgeInsets.all(5),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              needList[index]["title"]!,
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              needList[index]["time"]!,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(70, 0, 0, 0)),
                            )
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Image.asset(
                  //   'assets/images/needer_location5.png',
                  //   height: 300,
                  //   width: 400,
                  //   fit: BoxFit.fitWidth,
                  // ),
                  SizedBox(
                    height: 310,
                    width: 410,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: Set.from(_markers),
                      // markers: Marker(),
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      myLocationButtonEnabled: true,
                    ),
                  ),
                ],
              ))
        ]))));
  }
}
