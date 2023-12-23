import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/view/ReadScreen/list.dart';

class ListVeiwContainerHorizontal extends StatefulWidget {
  final Function(int) onItemSelected;
  final int? selectedIndex;
  final ScrollController scrollController;

  const ListVeiwContainerHorizontal({
    Key? key,
    required this.onItemSelected,
    required this.scrollController,
    this.selectedIndex,
  }) : super(key: key);

  @override
  _ListVeiwContainerHorizontalState createState() =>
      _ListVeiwContainerHorizontalState();
}

class _ListVeiwContainerHorizontalState
    extends State<ListVeiwContainerHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: widget.scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: pageListLength.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                widget.onItemSelected(index);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1),
                color: widget.selectedIndex == index
                    ? Colors.black
                    : Colors.transparent,
                child: Image(
                  image: AssetImage(pageListLength[index].image),
                  height: 90.h,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
