import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/const/app_color.dart';
import 'package:pdf/const/app_style.dart';
import 'package:pdf/customweight/mybutton.dart';
import 'package:pdf/customweight/popup_menu.dart';
import 'package:pdf/view/ImportFiles/doc_list.dart';

class ImportFiles extends StatefulWidget {
  const ImportFiles({super.key});

  @override
  State<ImportFiles> createState() => _ImportFilesState();
}

class _ImportFilesState extends State<ImportFiles> {
  final bool _showLastContainer = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: AppColors.backgr,
        appBar: AppBar(
          backgroundColor: AppColors.mutiRed,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 27,
            ),
          ),
          title: Text(
            'Import Files',
            style: AppStyle.heading20whitew400,
          ),
          centerTitle: false,
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  showPopupMenu(context);
                });
              },
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 27,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: GridView.builder(
                    itemCount: DocumentContent.productContentLength.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 30.0,
                    ),
                    itemBuilder: (context, index) {
                      final productcontentlength =
                          DocumentContent.productContentLength;
                      return buildGridItem(productcontentlength[index]);
                    }),
              ),
            ),
            Visibility(
              visible: _showLastContainer,
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 30.h,
                    left: 179.w,
                    bottom: 30.h,
                    right: 14.w,
                  ),
                  color: AppColors.lightyallow,
                  child: MyButton(
                    text: 'Import',
                    style: AppStyle.heading20whitew400,
                    color: AppColors.mutiRed,
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget buildGridItem(DocumentContent item) {
    return Stack(
      children: [
        // Main image
        Image(image: AssetImage(item.image)),

        // Sub-image positioned on top
        Positioned(
          top: 10,
          right: 25,
          child: Image(image: AssetImage(item.subIamge)),
        ),
      ],
    );
  }
}
