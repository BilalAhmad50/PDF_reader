import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf/const/app_color.dart';
import 'package:pdf/const/app_style.dart';
import 'package:pdf/const/sizedbox_ext.dart';
import 'package:pdf/view/ReadScreen/read_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCustomBottomSheet {
 static void showBottomSheet(BuildContext context,
      {required VoidCallback onDelete,
      required VoidCallback onOtherAction,
      required String documentTitle}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _buildBottomSheet(context, onDelete, documentTitle);
      },
    );
  }


  static Widget _buildBottomSheet(BuildContext context, VoidCallback onDelete, String documentTitle, ) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Container(
                        padding: EdgeInsets.only(
                            top: 15.h, bottom: 15.h, left: 8.w, right: 8.w),
                        decoration: BoxDecoration(
                            color: AppColors.mutiRed,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Text(
                          'PDF',
                          style: AppStyle.heading17whitew400,
                        ),
                      ),
                      title: Text(documentTitle),
                      onTap: () {},
                    ),
                    16.h.sbh,
                    ListTile(
                      leading: SvgPicture.asset('assets/2.svg'),
                      title: Text('Open File'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReadScreen()));
                      },
                    ),
                    16.h.sbh,
                    ListTile(
                      leading: SvgPicture.asset('assets/3.svg'),
                      title: Text('Email'),
                      onTap: () {
                        Navigator.pop(context);
                        launch(
                            'mailto:bilalahmad.player.gmail.com?subject=This Is The Subject Title&body=This Is They Body Of Email');
                      },
                    ),
                    16.h.sbh,
                    ListTile(
                      leading: SvgPicture.asset('assets/4.svg'),
                      title: Text('Share File'),
                      onTap: () async {
                        Navigator.pop(context);
                        await Share.share('Link Of The Page');
                      },
                    ),
                    16.h.sbh,
                    ListTile(
                      leading: SvgPicture.asset('assets/5.svg'),
                      title: Text('Copy'),
                      onTap: () {},
                    ),
                    16.h.sbh,
                    ListTile(
                      leading: SvgPicture.asset('assets/6.svg'),
                      title: Text('Delete'),
                      onTap: () {
                        // Close the bottom sheet
                        Navigator.pop(context);

                        // Call the onDelete callback to delete the item
                        onDelete();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
