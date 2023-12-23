import 'package:flutter/material.dart';
import 'package:pdf/customweight/bottomSheet/buttom_sheet.dart';

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
    Navigator.pop(context); // Close the bottom sheet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Your widget content
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              MyCustomBottomSheet.showBottomSheet(
                context,
                onDelete: () => deleteItem(index), onOtherAction: () {  }, documentTitle: '',
              );
            },
          );
        },
      ),
    );
  }
}
