import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/view/ReadScreen/list.dart';

class ListVeiwContainerVertical extends StatefulWidget {
  final Function(int) onItemSelected;
  final int? selectedIndex;
  final ScrollController scrollController;

  const ListVeiwContainerVertical({
    Key? key,
    required this.onItemSelected,
    required this.scrollController,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _ListVeiwContainerVerticalState createState() =>
      _ListVeiwContainerVerticalState();
}

class _ListVeiwContainerVerticalState extends State<ListVeiwContainerVertical> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: widget.scrollController,
        scrollDirection: Axis.vertical,
        itemCount: pageListLength.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: GestureDetector(
              onTap: () {
                widget.onItemSelected(index);
              },
              child: Image(
                image: AssetImage(pageListLength[index].image),
                width: 150.w,
                height: 150.h,
              ),
            ),
          );
        },
      ),
    );
  }
}
