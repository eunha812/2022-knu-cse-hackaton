import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sonsu/pages/helper/volunteer/volunteer.dart';
import 'package:sonsu/pages/helper/helper_main/helper_main.dart';
import 'package:sonsu/pages/helper/helper_mypage/helper_mypage.dart';
import 'package:sonsu/pages/helper/little_help/little_help.dart';
import 'package:sonsu/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PersistentTabController navController =
      PersistentTabController(initialIndex: 2);

  List<Widget> _showScreen() {
    return [
      Volunteer(),
      const LittleHelp(),
      const HelperMain(),
      const HelperMypage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.volunteer_activism_rounded),
        activeColorPrimary: kMainYellow,
        inactiveColorPrimary: kBlack,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.local_library_rounded),
        activeColorPrimary: kMainYellow,
        inactiveColorPrimary: kBlack,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_rounded),
        activeColorPrimary: kMainYellow,
        inactiveColorPrimary: kBlack,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.face_rounded),
        activeColorPrimary: kMainYellow,
        inactiveColorPrimary: kBlack,
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: navController,
      screens: _showScreen(),
      items: _navBarItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10),
          colorBehindNavBar: Colors.white),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
