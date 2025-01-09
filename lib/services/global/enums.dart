enum StorageKeys {
  isFirstTimer('isFirstTimer');

  const StorageKeys(this.keyString);

  final String keyString;
}

enum UserRole {
  isRetailer('Retailer'),
  isWholesaler('Wholesaler');

  const UserRole(this.value);

  final String value;
}
