import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sonsu/controllers/notification_controller.dart';
import 'package:sonsu/pages/needer/helping_page.dart';
import 'package:sonsu/pages/needer/match_try_page.dart';
import 'package:sonsu/pages/helper/helper_main/alarm_list.dart';
import 'package:sonsu/pages/needer/needer_home_page.dart';
import 'package:sonsu/pages/needer/match_complete_page.dart';
import 'package:sonsu/pages/home_page.dart';
import 'package:sonsu/pages/needer/needer_profile_page.dart';
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
            GetPage(name: '/', page: () => const HomePage()),
            GetPage(
                name: '/home',
                page: () => const HomePage(),
                transition: Transition.fadeIn),
            GetPage(name: '/alarm', page: () => const AlarmList()),
            GetPage(name: '/needer-home', page: () => const NeederHomePage()),
            GetPage(name: '/match-try', page: () => const MatchTryPage()),
            GetPage(
                name: '/match-complete', page: () => const MatchCompletePage()),
            GetPage(name: '/helping', page: () => const HelpingPage()),
            // GetPage(name: '/helping-history', page: () => const HelpingHistoryPage()),
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
