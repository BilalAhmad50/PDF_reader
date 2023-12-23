import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/const/app_color.dart';
import 'package:pdf/const/app_style.dart';

class MyButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final Color? color;
  final TextStyle? style;
  final VoidCallback? onpress;
  const MyButton(
      {super.key,
      this.height,
      this.width,
      required this.text,
      this.color = AppColors.darkBlue,
      this.style,
      this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        width: width ?? 177.w,
        height: height ?? 37.h,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
            )),
        child: Center(
            child: Text(
          text,
          style: style ?? AppStyle.heading16Whitew700,
        )),
      ),
    );
  }
}
