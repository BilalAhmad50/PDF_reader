import 'package:flutter/material.dart';

void showPopupMenu(BuildContext context) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  final RenderBox button = context.findRenderObject() as RenderBox;

  final double right =
      overlay.size.width - button.localToGlobal(Offset.zero).dx;
  final double top = 0.0;
  final double bottom =
      overlay.size.height - button.localToGlobal(Offset.zero).dy;

  showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(right, top, right, bottom),
    items: [
      const PopupMenuItem<String>(
        child:Text('Select All')
      ),
      const PopupMenuItem<String>(
        child: ListTile(
          
          title: Text(
            'Sort By',
            style: TextStyle(fontWeight: FontWeight.bold), // Custom weight here
          ),
        ),
      ),
    ],
  ).then((value) {
    if (value != null) {
      // Handle the selected option
      print('Selected: $value');
    }
  });
}
