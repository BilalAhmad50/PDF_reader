import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/Provider/favorite_provider.dart';
import 'package:pdf/Provider/recent_provider.dart';
import 'package:pdf/const/app_color.dart';
import 'package:pdf/const/app_style.dart';
import 'package:pdf/const/sizedbox_ext.dart';
import 'package:pdf/customweight/bottomSheet/buttom_sheet.dart';
import 'package:pdf/view/ReadScreen/read_screen.dart';
import 'package:provider/provider.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onDelete;
  final VoidCallback onOtherAction;
  final VoidCallback onStarTap; // Add this line

  const CustomRow({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onDelete,
    required this.onOtherAction,
    required this.onStarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);

    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.mutiRed,
          ),
          child: Text(
            'PDF',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 205.w,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigate to ReadScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              Provider.of<RecentProvider>(context,listen: false)
                                  .addRecentDocument(title);
                              return ReadScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        title,
                        style: AppStyle.heading17blackw400,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        provider.toggleFavorite(title);
                      },
                      child: Icon(
                        Icons.star,
                        color: provider.documents.contains(title)
                            ? AppColors.customBlue
                            : Colors
                                .grey, // Change color based on favorite status
                      ),
                    ),
                  ],
                ),
              ),
              6.h.sbh,
              Text(
                subTitle,
                style: AppStyle.heading12blackw300,
              )
            ],
          ),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            MyCustomBottomSheet.showBottomSheet(
              context,
              onDelete: onDelete,
              onOtherAction: onOtherAction,
              documentTitle: title,
            );
          },
          child: Icon(
            Icons.more_vert,
            size: 39,
          ),
        )
      ],
    );
  }
}
