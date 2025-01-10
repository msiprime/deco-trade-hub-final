import 'package:flutter_template_by_msi/features/Authentication/data/data_source/auth_datasource.dart';
import 'package:flutter_template_by_msi/features/Authentication/domain/repository/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl({
    required AuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;
  final AuthDataSource _authDataSource;

  @override
  Future<User> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<User> signIn({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<User> signUp({
    required String email,
    required String password,
    required String fullName,
    required String username,
    required String userRole,
  }) {
    throw UnimplementedError();
  }
}
