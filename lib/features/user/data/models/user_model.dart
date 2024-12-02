// data/models/user_model.dart
import 'package:flutter_template_by_msi/features/user/domain/entities/user.dart';

class UserModel {
  UserModel({required this.id, required this.name});

  // Factory method to parse JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  final int id;
  final String name;

  User toEntity() {
    return User(id: id, name: name);
  }
}
