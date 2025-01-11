class UpdateProfileParams {
  UpdateProfileParams({
    required this.fullName,
    required this.userName,
    required this.email,
    required this.mobileNumber,
    required this.website,
    required this.avatarUrl,
  });
  final String? fullName;
  final String? userName;
  final String? email;
  final String? mobileNumber;
  final String? website;
  final String? avatarUrl;
}
