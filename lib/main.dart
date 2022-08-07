import 'dart:io';

import 'package:JudoRegistration/views/registration_page.dart';
import 'package:JudoRegistration/views/screensaver_page.dart';
import 'package:flutter/material.dart';
import 'package:JudoRegistration/constants.dart';
import 'package:JudoRegistration/routes.dart';
import 'package:JudoRegistration/views/home_page.dart';
import 'package:JudoRegistration/views/settings_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/google_API_controller.dart';
import 'controllers/settings_controller.dart';

// TO DO:
// make post request for trainingsregistration
// ADD package wakelock 0.6.2
// splashscreen


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await SettingsController.init();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //State management
    final apiController = ref.watch(apiControllerProvider);

    apiController.getDatafromAPI();

    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.white,
          onPrimary: Color.fromARGB(255, 40, 39, 42),
          secondary: Colors.grey,
          onSecondary: Colors.grey,
          background: Colors.grey,
          onBackground: Colors.grey,
          surface: Colors.grey,
          onSurface: Colors.grey,
          error: Colors.grey,
          onError: Colors.grey,
        ),

        // appBarTheme: const AppBarTheme(
        //   color: primaryColor,

        // ),
      ),
      routes: {
        Routes.pageHome: (context) => const HomePage(),
        Routes.pageSettings: (context) => const SettingsPage(),
        Routes.screensaver: (context) => const ScreensaverPage(),
        Routes.registration: ((context) => const RegistrationPage()),
      },
    );
  }
}
