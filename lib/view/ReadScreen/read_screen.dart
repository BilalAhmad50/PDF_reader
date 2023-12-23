import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf/const/app_color.dart';
import 'package:pdf/const/sizedbox_ext.dart';
import 'package:pdf/view/ReadScreen/list_view_hr.dart';
import 'package:pdf/view/ReadScreen/list_view_vr.dart';
import 'package:share_plus/share_plus.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  int? selectedIndex;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgr,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(254, 223, 220, 1),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              size: 25,
            ),
          ),
          actions: [
            SvgPicture.asset('assets/iconCarrier.svg'),
            10.w.sbw,
            // IconButton for sharing
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.black,
              ),
              onPressed: () async {
                await Share.share('Link Of The Page');
              },
            ),
            10.w.sbw,
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: SvgPicture.asset('assets/iconCarrier2.svg'),
            )
          ],
        ),
        body: Column(
          children: [
            50.h.sbh,
            Divider(
              thickness: 3,
              indent: 20,
              endIndent: 20,
            ),
            ListVeiwContainerVertical(
              onItemSelected: (int index) {
                setState(() {
                  selectedIndex = index;
                });
                // Scroll to the selected index in the horizontal list
                _scrollController.animateTo(
                  index *
                      (90.w + 1.w), // Adjust the item width and separator width
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              scrollController: _scrollController,
              selectedIndex: selectedIndex,
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 8.h, left: 5.w, right: 5.w, bottom: 8.h),
              height: 120.h,
              color: AppColors.bgColor,
              child: Center(
                child: ListVeiwContainerHorizontal(
                  onItemSelected: (int index) {
                    setState(() {
                      selectedIndex = index;
                    });
                    _scrollController.animateTo(
                      index * (90.w + 1.w),
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  scrollController: _scrollController,
                  selectedIndex: selectedIndex,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
