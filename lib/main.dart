import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/Provider/favorite_provider.dart';
import 'package:pdf/Provider/recent_provider.dart';
import 'package:pdf/SplashScreen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
          key: UniqueKey(), // Add this line
        ),
        ChangeNotifierProvider(
          create: (context) => RecentProvider(),
          key: UniqueKey(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (_, child) => MaterialApp(
          navigatorKey: navigatorKey,
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
