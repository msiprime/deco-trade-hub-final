/// The list of options shown in drawer.
// ignore_for_file: public_member_api_docs

library;

const headerPhoto = '';
const fakeStreet = 'Olive Street 54/12';

const googleApiKey = '';

const noLocation = 'Pick location';
const searchFoodLabel = 'Search food...';
const quickSearchLabel = 'Quick Search';
const searchLocationLabel = 'Search';

enum DrawerOption {
  profile('Profile'),
  orders('Orders');

  const DrawerOption(this.name);

  final String name;
}

// /// Navigation bar items
// List<NavBarItem> mainNavigationBarItems({
//   required String homeLabel,
//   required String cartLabel,
// }) =>
//     <NavBarItem>[
//       NavBarItem(icon: LucideIcons.chefHat, label: homeLabel),
//       NavBarItem(icon: LucideIcons.shoppingCart, label: cartLabel),
//     ];
//
// class NavBarItem {
//   NavBarItem({
//     this.icon,
//     this.label,
//     this.child,
//   });
//
//   final String? label;
//   final Widget? child;
//   final IconData? icon;
//
//   String? get tooltip => label;
// }
