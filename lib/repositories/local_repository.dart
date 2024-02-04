// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agrak_flutter_challenge/config/database_provider.dart';
import 'package:agrak_flutter_challenge/domain/create_user_model.dart';
import 'package:agrak_flutter_challenge/domain/user_model.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_repository.g.dart';

@riverpod
UserLocalRepository userLocalRep(UserLocalRepRef ref) {
  final isar = ref.watch(dbProvider);
  return UserLocalRepository(isar: isar);
}

class UserLocalRepository {
  final Isar _isar;
  UserLocalRepository({
    required Isar isar,
  }) : _isar = isar;

  Stream<List<User>> getAll() {
    return _isar.users.where().watch(fireImmediately: true);
    // Convert this list to a stream to keep updated with the database
  }

  Future<User> create(User user) async {
    // valor user sera ingresado en el widget
    await _isar.writeTxn(() async {
      await _isar.users.put(user);
    });
    return user;
  }

  Future<User> update(String id, CreateUser data) async {
    final user = await _isar.users.get(fastHash(id));

    if (user == null) {
      throw Exception('Usuario con ID ${user?.id} no encontrado');
    }
    final updateUser = user.copyWith(
      firstName: data.firstName,
      secondName: data.secondName,
      email: data.email,
      avatar: data.avatar,
    );
    return _isar.writeTxn(() async {
      await _isar.users.put(updateUser);
      return updateUser;
    });
  }

  Future<void> delete(int id) async {
    await _isar.writeTxn(() async {
      await _isar.users.delete(id);
    });
  }

  Future<void> setUsers(List<User> network) async {
    _isar.writeTxn(() async {
      await _isar.users.clear();
      await _isar.users.putAll(network);
    });
  }

  Future<User?> getUserById(String id) async {
    return _isar.users.where().filter().idEqualTo(id).findFirst();
  }
}
