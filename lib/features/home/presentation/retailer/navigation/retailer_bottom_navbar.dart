import 'package:flutter/material.dart';
import 'package:flutter_template_by_msi/app/screens/home_screen/src/ui/home_screen.dart';
import 'package:flutter_template_by_msi/features/home/presentation/retailer/view/retailer_home_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class RetailerRoute extends StatelessWidget {
  const RetailerRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: const [
        HomeScreen(),
        RetailerHomePage(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: 'Home',
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart),
          title: 'Cart',
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
