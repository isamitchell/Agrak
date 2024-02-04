import 'package:agrak_flutter_challenge/application/users_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/user_model.dart';

part 'home_screen.g.dart';

@riverpod
Stream<List<User>> users(UsersRef ref) {
  final service = ref.watch(userServiceProvider);
  return service.getAll();
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider);

    addUser() {
      Navigator.of(context).pushNamed('viewScreen');
    }

    editUser(String userId) {
      Navigator.of(context).pushNamed('viewScreen', arguments: userId);
    }

    deleteUSer(data, index) async {
      final userDelete =
          await ref.read(userServiceProvider).delete(data[index].id.toString());
      return userDelete;
    }

    return Scaffold(
        floatingActionButton: IconButton(
          alignment: Alignment.bottomRight,
          icon: const Icon(Icons.add),
          onPressed: addUser,
        ),
        appBar: AppBar(
          title: const Text(
            'Agrak Flutter Challenge',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 79, 151, 82),
        ),
        body: Center(
          child: users.when(
            data: (List<User> data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(data[index].avatar),
                      ),
                      title: Text(
                          '${data[index].firstName} ${data[index].secondName}'),
                      subtitle: Text(data[index].email),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  editUser(data[index].id.toString())),
                          const SizedBox(width: 5),
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => deleteUSer(data, index))
                        ],
                      ));
                },
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text(error.toString()),
          ),
        ));
  }
}
