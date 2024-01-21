import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:joel_abreu_multistore/firebase_options.dart';
import 'package:joel_abreu_multistore/views/buyers/auth/login_screen.dart';
import 'package:joel_abreu_multistore/views/buyers/main_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'AROneSans',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        ),
        title: "Multi Store App",
        home:  LoginScreen());
  }
}

