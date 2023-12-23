import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/const/app_color.dart';
import 'package:pdf/view/DocumentScreen/document_screen.dart';
import 'package:pdf/view/Favorites/favorites.dart';
import 'package:pdf/view/RecentSreen/recent_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    MyDocumentScreen(),
    MyFavoritesScreen(),
    MyRecentScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Color(0xffFED766),
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding:
                  EdgeInsets.only(top: 7.h, bottom: 7.h, right: 7.w, left: 7.w),
              decoration: ShapeDecoration(
                color: AppColors.mutiRed,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Icon(
                Icons.description,
                color: _currentIndex == 0 ? Colors.blue : Colors.white,
              ),
            ),
            label: 'Document',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding:
                  EdgeInsets.only(top: 7.h, bottom: 7.h, right: 7.w, left: 7.w),
              decoration: ShapeDecoration(
                color: AppColors.mutiRed,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Icon(
                Icons.favorite,
                color: _currentIndex == 1 ? Colors.blue : Colors.white,
              ),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding:
                  EdgeInsets.only(top: 7.h, bottom: 7.h, right: 7.w, left: 7.w),
              decoration: ShapeDecoration(
                color: AppColors.mutiRed,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Icon(
                Icons.access_time,
                color: _currentIndex == 2 ? Colors.blue : Colors.white,
              ),
            ),
            label: 'Recent',
          ),
        ],
      ),
    );
  }
}

