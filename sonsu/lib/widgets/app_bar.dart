import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

PreferredSizeWidget buildAppbar(String label, Color? color) {
  return AppBar(
    backgroundColor: color,
    elevation: 3,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Get.back();
      },
    ),
    title: Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
  );
}
