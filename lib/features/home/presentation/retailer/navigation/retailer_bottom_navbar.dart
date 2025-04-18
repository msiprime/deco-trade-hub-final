import 'package:flutter/material.dart';
import 'package:deco_trade_hub/features/profile/presentation/pages/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../view/retailer_home_page.dart';

class RetailerRoute extends StatelessWidget {
  const RetailerRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: const [
        RetailerHomePage(),
        ProfilePage(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: 'Home',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person_2_outlined),
          title: 'Profile',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
      controller: PersistentTabController(),
      animationSettings: const NavBarAnimationSettings(
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
