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
