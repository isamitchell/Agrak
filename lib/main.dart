import 'package:agrak_flutter_challenge/config/database_provider.dart';
import 'package:agrak_flutter_challenge/presentation/home_screen.dart';
import 'package:agrak_flutter_challenge/presentation/view_update_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await openIsar();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agrak Flutter Challenge',
      initialRoute: 'home',
      routes: {
        'viewScreen': (context) => const ViewScreen(),
        'home': (context) => const HomeScreen(),
      },
    
    );
  }
}

