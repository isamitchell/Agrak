import 'package:agrak_flutter_challenge/application/users_service.dart';
import 'package:flutter/material.dart';
import 'package:agrak_flutter_challenge/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// part 'view_update_screen.g.dart';

class ViewScreen extends ConsumerWidget {
  const ViewScreen({super.key});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ModalRoute.of(context)!.settings.arguments as String?;
    
    deleteUSer() async {
      await ref.read(userServiceProvider).delete(userId!);
      return Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Datos de Usuario',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 79, 151, 82),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: deleteUSer,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: UserForm(
          userId: userId,
        ),
      ),
    );
  }
}
