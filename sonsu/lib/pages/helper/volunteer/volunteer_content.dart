import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';

class VolunteerContent extends StatefulWidget {
  VolunteerContent({Key? key}) : super(key: key);

  @override
  State<VolunteerContent> createState() => _VolunteerContentState();
}

class _VolunteerContentState extends State<VolunteerContent> {
  final cardList = [
    {
      "images": "assets/images/cardnews01.png",
      "title": "한강공원 자원봉사자 모집",
      "view": "10",
      "count": "3/220",
    },
    {
      "images": "assets/images/cardnews02.png",
      "title": "청소년의 봉사활동! 나래봉사단 모집!",
      "view": "13",
      "count": "0/10",
    },
    {
      "images": "assets/images/cardnews03.png",
      "title": "도민이 전하는 자원봉사, 2차 김장 봉사자 모집",
      "view": "3",
      "count": "0/20",
    },
    {
      "images": "assets/images/cardnews04.png",
      "title": "국제청년센터 유니버스 봉사자 모집합니다!",
      "view": "4",
      "count": "1/50",
    },
    {
      "images": "assets/images/cardnews05.png",
      "title": "아지트 대학생 정기봉사자 모집",
      "view": "2",
      "count": "0/15",
    },
    {
      "images": "assets/images/cardnews06.png",
      "title": "5월 어버이날 행사 봉사자 모집",
      "view": "6",
      "count": "2/40",
    },
    {
      "images": "assets/images/cardnews07.png",
      "title": "대구 청소년 댄스페스티벌 자원봉사자 모집!",
      "view": "12",
      "count": "2/30",
    },
    {
      "images": "assets/images/cardnews08.png",
      "title": "고려대 연탄의 온도 함께할 봉사자 모집합니다!",
      "view": "24",
      "count": "3/16",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 7 / 12.5,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15),
          itemCount: cardList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Color(0xffF4F4F4),
              child: InkWell(
                splashColor: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          cardList[index]["images"]!,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        cardList[index]["title"]!,
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.visibility_rounded,
                            color: Colors.black,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            cardList[index]["view"]!,
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.person_add_rounded,
                            color: Colors.black,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            cardList[index]["count"]!,
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
