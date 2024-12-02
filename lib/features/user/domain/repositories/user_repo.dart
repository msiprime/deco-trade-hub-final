import 'package:dartz/dartz.dart';
import 'package:flutter_template_by_msi/features/user/domain/entities/user.dart';

//ignore: one_member_abstracts
abstract interface class UserRepo {
  Future<Either<String, List<User>>> fetchUsers();
}
