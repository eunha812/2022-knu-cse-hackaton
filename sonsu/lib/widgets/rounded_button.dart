import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sonsu/utils/constants.dart';

class RoundedButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? icon;
  final String? label;
  final EdgeInsets? padding;
  final double? radius;
  final Color? textColor;
  final Color? btnColor;
  final double? fontSize;

  const RoundedButton({
    required this.onPressed,
    this.icon,
    this.label,
    this.padding,
    this.radius,
    this.textColor,
    this.btnColor,
    this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon ?? Container(),
      label: Text(
        label ?? '',
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? 11.sp,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 10,
        padding: padding,
        primary: btnColor ?? kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
      ),
    );
  }
}
