import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:sonsu/pages/helpee/helpee_home_page.dart';
import 'package:sonsu/pages/home_page.dart';
import 'package:sonsu/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Son-Su',
          initialRoute: '/helpee-home',
          getPages: [
            GetPage(name: '/', page: () => const SplashtoHome()),
            GetPage(
                name: '/home',
                page: () => const HomePage(),
                transition: Transition.fadeIn),
            GetPage(name: '/splash', page: () => const SplashPage()),
            GetPage(name: '/helpee-home', page: () => const HelpeeHomePage()),
            // GetPage(name: '/SignIn', page: () => const SignInPage()),
          ],
        );
      },
    );
  }
}

class SplashtoHome extends StatelessWidget {
  const SplashtoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashPage(),
          );
        } else {
          // Loading is done, return the app:

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Son-Su',
            theme: ThemeData(),
            home: const HomePage(),
          );
        }
      },
    );
  }
}
