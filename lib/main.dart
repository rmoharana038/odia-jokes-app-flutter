import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const OdiaJokesApp());
}

class OdiaJokesApp extends StatelessWidget {
  const OdiaJokesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ଓଡ଼ିଆ ମଜାକଥା',
      themeMode: ThemeMode.system,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
