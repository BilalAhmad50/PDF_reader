import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/const/app_color.dart';
import 'package:pdf/const/app_style.dart';
import 'package:pdf/const/sizedbox_ext.dart';
import 'package:pdf/customweight/mybutton.dart';
import 'package:pdf/view/BottomNavigationBar/bnb_bar.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgr,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to',
              style: AppStyle.heading25Blackw700,
            ),
            Text('PDF READER', style: AppStyle.heading25mutiRedw700),
            Image(image: AssetImage('assets/Welcome.png')),
            Text('Permission Required', style: AppStyle.heading25Blackw700),
            Text(
              'To read your files please allow',
              style: AppStyle.heading17Blackw300,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'PDF Reader ',
                    style: AppStyle.heading17mutiRedw300,
                  ),
                  Text(
                    'to access all your files.',
                    style: AppStyle.heading17Blackw300,
                  )
                ],
              ),
            ),
            44.h.sbh,
            InkWell(
               onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomBottomNavigationBar())),
              child: MyButton(
                text: 'Allow',
                color: AppColors.mutiRed,
              ),
            ),
            29.h.sbh,
            InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomBottomNavigationBar()
                        )),
              child: MyButton(text: 'Later', color: AppColors.backgr, style: TextStyle(color:Colors.black),))
          ],
        ),
      ),
    );
  }
}
