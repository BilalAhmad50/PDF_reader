import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf/const/app_color.dart';
import 'package:pdf/const/app_style.dart';
import 'package:pdf/const/sizedbox_ext.dart';
import 'package:pdf/customweight/CustomRow/custom_row.dart';
import 'package:pdf/customweight/searchTextF.dart';
import 'package:pdf/Provider/favorite_provider.dart';
import 'package:pdf/Provider/recent_provider.dart';
import 'package:provider/provider.dart';

class MyRecentScreen extends StatefulWidget {
  const MyRecentScreen({Key? key}) : super(key: key);

  @override
  State<MyRecentScreen> createState() => _MyRecentScreenState();
}

class _MyRecentScreenState extends State<MyRecentScreen> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    List<String> recentDocuments =
        Provider.of<RecentProvider>(context).recentDocuments;


    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mutiRed,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.mutiRed,
          title: _isSearching
              ? const SearchTextField(
                  hintText: 'Search here',
                )
              : const Text('PDF Reader', style: AppStyle.heading20whitew400),
          centerTitle: false,
          actions: <Widget>[
            Visibility(
              visible: !_isSearching,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: SvgPicture.asset('assets/Repoicon.svg'),
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                });
              },
              icon: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Icon(
                  _isSearching
                      ? CupertinoIcons.clear_circled_solid
                      : Icons.search,
                ),
              ),
              color: Colors.white,
              iconSize: 35,
            ),
          ],
        ),
        body: Column(
          children: [
            const Center(
              child: Text(
                "Recent",
                style: AppStyle.heading20whitew500,
              ),
            ),
            16.h.sbh,
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 5.h, left: 5.w, bottom: 12.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                  color: AppColors.backgr,
                ),
                child: ListView.builder(
                  itemCount: recentDocuments.length,
                  itemBuilder: (context, index) {
                    String documentTitle = recentDocuments[index];
                    return Column(
                      children: [
                        16.h.sbh,
                        CustomRow(
                          title: documentTitle,
                          subTitle: '21-June-2023 11:00 AM 512 KB',
                          onDelete: () {
                            setState(() {
                              Provider.of<RecentProvider>(context,listen: false
                                      )
                                  .removeRecentDocument(documentTitle);
                            });
                          },
                          onOtherAction: () {
                            // Implement other action logic
                          },
                          onStarTap: () {
                            // Implement star tap logic

                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
