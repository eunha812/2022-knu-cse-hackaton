import 'package:flutter/material.dart';
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
            theme: ThemeData(
            ),
            home: HomePage(),
          );
        }
      },
    );

  }
}
