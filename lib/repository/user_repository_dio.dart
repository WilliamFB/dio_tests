import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_test/model/user.dart';
import 'package:dio_test/repository/user_repository.dart';

class UserRepositoryDio implements UserRepository {
  final Dio _dio;

  UserRepositoryDio(this._dio);

  @override
  Future<List<User>> findAllUsers() async {
    try {
      // Diferente do pacote http, no dio não é necessário fazer o json decode.
      final response = await _dio
          .get<List>('https://5f7cba02834b5c0016b058aa.mockapi.io/api/users');

      return response.data?.map((e) => User.fromMap(e)).toList() ?? [];
    } on DioError catch (e) {
      // O DioError possui diversas informações que podem ser usadas nos logs.
      log('DioError no findAllUsers', error: e);
      log('Status: ${e.response?.statusCode}');
      rethrow;
    } catch (e) {
      log('Erro no findAllUsers', error: e);
      rethrow;
    }
  }
}
