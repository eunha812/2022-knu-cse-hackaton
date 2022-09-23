import 'package:flutter/material.dart';
import 'package:sonsu/pages/helper/volunteer/volunteer_content.dart';
import 'package:sonsu/utils/constants.dart';
import 'package:sonsu/widgets/app_bar.dart';

class Volunteer extends StatefulWidget {
  const Volunteer({Key? key}) : super(key: key);

  @override
  State<Volunteer> createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar('봉사 모집', kMainYellow, false),
      body: VolunteerContent(),
      //Expanded(child: VolunteerContent()),
    );
  }
}
