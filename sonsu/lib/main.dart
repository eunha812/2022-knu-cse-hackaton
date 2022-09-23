import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sonsu/controllers/notification_controller.dart';
import 'package:sonsu/pages/nedder/helping_page.dart';
import 'package:sonsu/pages/nedder/match_try_page.dart';
import 'package:sonsu/pages/helper/helper_main/alarm_list.dart';
import 'package:sonsu/pages/nedder/needer_home_page.dart';
import 'package:sonsu/pages/nedder/match_complete_page.dart';
import 'package:sonsu/pages/home_page.dart';
import 'package:sonsu/pages/nedder/needer_profile_page.dart';
import 'package:sonsu/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          initialRoute: '/needer-home',
          getPages: [
            GetPage(name: '/', page: () => const SplashtoHome()),
            GetPage(
                name: '/home',
                page: () => const HomePage(),
                transition: Transition.fadeIn),
            GetPage(name: '/splash', page: () => const SplashPage()),
            GetPage(name: '/alarm', page: () => const AlarmList()),
            GetPage(name: '/needer-home', page: () => const NeederHomePage()),
            GetPage(name: '/match-try', page: () => const MatchTryPage()),
            GetPage(
                name: '/match-complete', page: () => const MatchCompletePage()),
            GetPage(name: '/helping', page: () => const HelpingPage()),
            GetPage(
                name: '/needer-profile', page: () => const NeederProfilePage()),
          ],
          initialBinding: BindingsBuilder.put(() => NotificationController(),
              permanent: true),
          theme: ThemeData(
            fontFamily: 'Noto_Sans_KR',
          ),
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
