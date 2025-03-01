import 'package:flutter/material.dart';
import 'package:flutter_template_by_msi/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter_template_by_msi/features/whole_saler/home/presentation/view/wholesaler_home_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class WholesalerRoute extends StatelessWidget {
  const WholesalerRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: const [
        WholesalerHomePage(),
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
          icon: const Icon(Icons.person),
          title: 'Profile',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
      controller: PersistentTabController(),
    );
  }
}
