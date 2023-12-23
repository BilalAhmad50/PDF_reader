// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pdf/const/app_color.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String appBarTitle;
//   final Color appBarColor;

//   final List<Widget>? actions;
//   final Widget? leading;

//   final Color titleColor;
//   final Color bgColor;
//   final bool isCenter;
//   final bool isPop;
//   final TextStyle? textStyle;
//   final void Function()? onPop;
//   const CustomAppBar(
//       {super.key,
//       this.isCenter = true,
//       this.isPop = false,
//       this.appBarColor = AppColors.whiteColor,
//       this.actions,
//       this.appBarTitle = "appBarTitle",
//       this.titleColor = Colors.black,
//       this.bgColor = Colors.black,
//       this.leading = const Icon(
//         Icons.keyboard_arrow_left,
//         color: Colors.white,
//       ),
//       this.onPop,
//       this.textStyle, required bool isSearching, required Null Function() onSearchPressed});

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       toolbarHeight: 80,
//       elevation: 0,
//       centerTitle: isCenter,
//       backgroundColor: appBarColor,
//       actions: actions,
//       title: Text(
//         appBarTitle,
//         style: textStyle ??
//             TextStyle(
//                 color: titleColor,
//                 fontSize: 15.sp,
//                 fontWeight: FontWeight.w400),
//       ),
//       leading: GestureDetector(
//           onTap: isPop
//               ? onPop ??
//                   () {
//                     Navigator.pop(context);
//                   }
//               : null,
//           child: leading),
//     );
//   }
// }
