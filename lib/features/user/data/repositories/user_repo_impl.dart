import 'package:dartz/dartz.dart';
import 'package:flutter_template_by_msi/features/user/data/data_sources/user_ds.dart';
import 'package:flutter_template_by_msi/features/user/data/models/user_model.dart';
import 'package:flutter_template_by_msi/features/user/domain/entities/user.dart';
import 'package:flutter_template_by_msi/features/user/domain/repositories/user_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepo)
class UserRepoImpl implements UserRepo {
  UserRepoImpl(this.userDataSource);

  final UserDS userDataSource;

  @override
  Future<Either<String, List<User>>> fetchUsers() async {
    try {
      final response = await userDataSource.fetchUsers();

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;

        final users = data
            .map(
              (e) => UserModel.fromJson(e as Map<String, dynamic>).toEntity(),
            )
            .toList();

        return Right(users);
      } else {
        return const Left('Failed to fetch users');
      }
    } on Exception catch (e) {
      return Left('$e');
    }
  }
}
