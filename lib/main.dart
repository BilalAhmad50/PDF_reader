import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/model/Provider/favorite_provider.dart';
import 'package:pdf/model/Provider/recent_provider.dart';
import 'package:pdf/view/SplashScreen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecentProvider(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Your App Title',
          theme: ThemeData(
            primaryColor: Colors.blueGrey,
            useMaterial3: true,
          ),
          home: SplashScreen(),
        ),
        designSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
