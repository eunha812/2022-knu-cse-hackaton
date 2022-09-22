import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final Function()? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(55),
        primary: kMainRed, // <-- Button color
        // onPrimary: Colors.red, // <-- Splash color
      ),
      child: icon,
    );
  }
}
