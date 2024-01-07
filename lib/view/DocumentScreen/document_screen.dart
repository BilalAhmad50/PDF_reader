import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf/const/app_color.dart';
import 'package:pdf/const/app_style.dart';
import 'package:pdf/const/sizedbox_ext.dart';
import 'package:pdf/customweight/searchTextF.dart';
import 'package:pdf/customweight/CustomRow/custom_row.dart';
import 'package:pdf/model/Provider/favorite_provider.dart';
import 'package:pdf/view/ImportFiles/import_files.dart';
import 'package:provider/provider.dart';

class MyDocumentScreen extends StatefulWidget {
  const MyDocumentScreen({Key? key}) : super(key: key);

  @override
  State<MyDocumentScreen> createState() => _MyDocumentScreenState();
}

class _MyDocumentScreenState extends State<MyDocumentScreen> {
  bool _isSearching = false;
  bool _showImportContainer = false;
  List<String> documents = [
    'Document 1',
    'Document 2',
    'Document 3',
    'Document 4',
    'Document 5',
    'Document 6',
    'Document 7',
    'Document 8',
    'Document 9',
    'Document 10',
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context, listen: false);

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
              "All Files",
              style: AppStyle.heading20whitew500,
            )),
            16.h.sbh,
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 5.w, bottom: 12.w),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r)),
                  color: AppColors.backgr,
                ),
                child: ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        16.h.sbh,
                        CustomRow(
                          title: documents[index],
                          subTitle: '21-June-2023 11:00 AM 512 KB',
                          onDelete: () {
                            setState(() {
                              documents.removeAt(index);
                            });
                          },
                          onOtherAction: () {},
                          onStarTap: () {
                            provider.toggleFavorite(documents[index]);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Visibility(
              visible: _showImportContainer,
              child: Container(
                padding: EdgeInsets.only(
                  top: 18.h,
                  bottom: 22.h,
                  left: 11,
                ),
                color: AppColors.lightyallow,
                child: Row(
                  children: [
                    SvgPicture.asset('assets/gallary.svg'),
                    10.w.sbw,
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImportFiles())),
                      child: Text(
                        'Import Files',
                        style: AppStyle.heading20blackw400,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: Stack(children: [
          Positioned(
            bottom: _showImportContainer ? 90.0 : 16.0,
            right: 16.0,
            child: FloatingActionButton(
              elevation: 0,
              onPressed: () {
                setState(() {
                  _showImportContainer = !_showImportContainer;
                });
              },
              backgroundColor: AppColors.mutiRed,
              shape: CircleBorder(),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
