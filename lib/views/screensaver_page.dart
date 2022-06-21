import 'package:JudoRegistration/routes.dart';
import 'package:flutter/material.dart';

class ScreensaverPage extends StatelessWidget {
  const ScreensaverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, Routes.pageHome);
          },
          child: Center(
            child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset('assets/images/screensaver.png', fit: BoxFit.cover,)),
          ),
        ));
  }
}
