import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/const/app_color.dart';
import 'package:pdf/const/app_style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final int? minLines;
  final BorderRadius? borderRadius;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? width;
  final TextStyle? hintStyle;
  final bool isVisible;
  final TextInputType? keyboardType;
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.width,
      this.maxLines,
      this.prefixIcon,
      this.isVisible = false,
      this.keyboardType,
      this.minLines,
      this.borderRadius,
      this.hintStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.1),
            offset: Offset(0, 3),
            blurRadius: 9,
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        maxLines: maxLines ?? 1,
        minLines: minLines,
        obscureText: isVisible,
        style: AppStyle.heading14Blackw500,
        decoration: InputDecoration(
            fillColor: AppColors.whiteColor,
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
            filled: true,
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            constraints: BoxConstraints(maxWidth: width ?? double.infinity),
            hintStyle: hintStyle ??
                TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
            enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.transparent)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
