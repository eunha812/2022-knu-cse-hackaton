import 'package:flutter/material.dart';
import 'package:sonsu/utils/constants.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.elevation,
    this.padding,
    this.backgroundColor,
  }) : super(key: key);

  final Function()? onPressed;
  final Widget? icon;
  final double? elevation;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation ?? 10,
        backgroundColor: backgroundColor ?? kMainRed,
        shape: const CircleBorder(),
        padding: padding ?? const EdgeInsets.all(55),
      ),
      child: icon,
    );
  }
}
