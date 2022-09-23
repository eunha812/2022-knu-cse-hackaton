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
  final double? elevation;

  const RoundedButton({
    required this.onPressed,
    this.icon,
    this.label,
    this.padding,
    this.radius,
    this.textColor,
    this.btnColor,
    this.fontSize,
    this.elevation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: btnColor ?? kPrimaryColor,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
      ),
      child: Text(
        label ?? '',
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? 11.sp,
        ),
      ),
    );
  }
}
