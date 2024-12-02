// domain/usecases/get_users.dart

import 'package:dartz/dartz.dart';
import 'package:flutter_template_by_msi/features/user/domain/entities/user.dart';
import 'package:flutter_template_by_msi/features/user/domain/repositories/user_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetUsers {
  GetUsers(this.repository);

  final UserRepo repository;

  Future<Either<String, List<User>>> call() async => repository.fetchUsers();
}
