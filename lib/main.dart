import 'package:flutter/material.dart';
import 'package:JudoRegistration/constants.dart';
import 'package:JudoRegistration/routes.dart';
import 'package:JudoRegistration/views/home_page.dart';
import 'package:JudoRegistration/views/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Routes.pageHome: (context) => const HomePage(),
        Routes.pageSettings: (context) => const SettingsPage(),
      },
    );
  }
}