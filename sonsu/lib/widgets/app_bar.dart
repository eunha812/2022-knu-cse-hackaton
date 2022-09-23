import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

PreferredSizeWidget buildAppbar(String label, Color? color, bool lead) {
  if (lead == true) {
    return AppBar(
      backgroundColor: color,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Get.back();
        },
      ),
      title: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  } else {
    return AppBar(
      backgroundColor: color,
      elevation: 0,
      title: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }
}
