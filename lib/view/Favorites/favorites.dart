import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pdf/Provider/favorite_provider.dart';
import 'package:pdf/const/app_color.dart';
import 'package:pdf/const/app_style.dart';
import 'package:pdf/const/sizedbox_ext.dart';
import 'package:pdf/customweight/searchTextF.dart';
import 'package:pdf/customweight/CustomRow/custom_row.dart';
import 'package:provider/provider.dart';

class MyFavoritesScreen extends StatefulWidget {
  const MyFavoritesScreen({Key? key}) : super(key: key);

  @override
  State<MyFavoritesScreen> createState() => _MyFavoritesScreenState();
}

class _MyFavoritesScreenState extends State<MyFavoritesScreen> {
  bool _isSearching = false;
  


  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<FavoriteProvider>(context); // Get the provider instance

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
                "Favorites",
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
                  itemCount: provider.documents.length,
                  itemBuilder: (context, index) {
                    String documentTitle = provider.documents.elementAt(index);
                    return Column(
                      children: [
                        16.h.sbh,
                        CustomRow(
                          title: documentTitle,
                          subTitle: '21-June-2023 11:00 AM 512 KB',
                          onDelete: () {
                            setState(() {
                             provider.removeFavorite(documentTitle);
                            });
                          },
                          onOtherAction: () {
                            // Implement your logic for other actions
                          }, onStarTap: () {  },
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
