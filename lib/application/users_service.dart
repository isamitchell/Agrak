// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agrak_flutter_challenge/domain/create_user_model.dart';
import 'package:agrak_flutter_challenge/domain/user_model.dart';
import 'package:agrak_flutter_challenge/repositories/local_repository.dart';
import 'package:agrak_flutter_challenge/repositories/network_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_service.g.dart';

@riverpod
UserService userService(UserServiceRef ref) {
  final userLocal = ref.watch(userLocalRepProvider);
  final userNetwork = ref.watch(userNetworkRepProvider);
  return UserService(userLocal, userNetwork);
}

class UserService {
  final UserLocalRepository _userLocal;
  final UserNetworkRepository _userNetwork;
  UserService(
    this._userLocal,
    this._userNetwork,
  );

  Stream<List<User>> getAll() async* {
    final userNetwork = await _userNetwork.getAll();
    await _userLocal.setUsers(userNetwork);
    yield* _userLocal.getAll();
  }

  Future<User> create(CreateUser createUser) async {
    final userCreated = await _userNetwork.create(createUser);
    await _userLocal.create(userCreated);
    return userCreated;
  }

  Future<User> update(String id, CreateUser data) async {
    final userUpdated = await _userNetwork.update(id, data);
    await _userLocal.update(id, data);
    return userUpdated;
  }

  Future<void> delete(String id) async {
    await _userNetwork.delete(id);
    await _userLocal.delete(fastHash(id));
  }

  Future<void> updateAll(List<User> network) async {
    await _userLocal.setUsers(network);
  }

  Future<User?> getUSer(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return _userLocal.getUserById(id);
  }
}
