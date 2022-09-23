import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';

class VolunteerContent extends StatefulWidget {
  VolunteerContent({Key? key}) : super(key: key);

  @override
  State<VolunteerContent> createState() => _VolunteerContentState();
}

class _VolunteerContentState extends State<VolunteerContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 20),
      // child: GridView.builder(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2,
      //         childAspectRatio: 0.8 / 0.9,
      //         mainAxisSpacing: 15,
      //         crossAxisSpacing: 15),
      //     itemBuilder: (BuildContext context, int index) {

      //     }),
      color: kMainLightGreen,
    );
  }
}
