class ProfileEntity {
  ProfileEntity({
    required this.id,
    required this.email,
    required this.userName,
    required this.fullName,
    required this.mobileNumber,
    required this.avatarUrl,
    required this.website,
    // required this.createdAt,
    required this.updatedAt,
    required this.isVerified,
  });

  final String id;
  final String email;
  final String userName;
  final String fullName;
  final String mobileNumber;
  final String avatarUrl;
  final String website;

  // final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isVerified;
}
