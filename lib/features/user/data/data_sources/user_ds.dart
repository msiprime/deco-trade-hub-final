import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

//ignore: one_member_abstracts
abstract interface class UserDS {
  Future<Response<dynamic>> fetchUsers();
}

@Injectable(as: UserDS)
class UserDSImpl implements UserDS {
  UserDSImpl(this.dio);

  final Dio dio;

  @override
  Future<Response<dynamic>> fetchUsers() async {
    try {
      final response2 = await dio
          .get<List<dynamic>>('https://jsonplaceholder.typicode.com/users');
      // final response2 = await RestClient()
      //     .get(APIType.public, 'https://jsonplaceholder.typicode.com/users');

      return response2;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(ConnectionError(error), stackTrace);
    }
  }
}
