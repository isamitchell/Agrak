// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agrak_flutter_challenge/config/http_provider.dart';
import 'package:agrak_flutter_challenge/domain/create_user_model.dart';
import 'package:dio/dio.dart';

import 'package:agrak_flutter_challenge/domain/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_repository.g.dart';

@riverpod
UserNetworkRepository userNetworkRep(UserNetworkRepRef ref) {
  final dio = ref.watch(httpProvider);
  return UserNetworkRepository(dio: dio);
}

class UserNetworkRepository {
  final Dio _dio;
  final url = '/api/v1/users';

  UserNetworkRepository({
    required Dio dio,
  }) : _dio = dio;

  Future<List<User>> getAll() async {
    final response = await _dio.get(url);
    final users = response.data as List; 
    return users.map((user) => User.fromMap(user)).toList();
  }

  Future<User> create(CreateUser createUser) async {
    final response = await _dio.post(
      url,
      data: createUser.toMap(),
    );
    final user = response.data as Map<String, dynamic>;
    return User.fromMap(user);
  }

  Future<User> update(String id, CreateUser createUser) async {
    final response = await _dio.put(
      '$url/$id',
      data: createUser.toMap(),
    );

    final userUpdate = response.data as Map<String, dynamic>;
    return User.fromMap(userUpdate);
  }

  Future<void> delete(String id) async {
    await _dio.delete(
      '$url/$id',
      
    );
  }
}
