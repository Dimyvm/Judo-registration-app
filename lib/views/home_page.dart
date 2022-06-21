import 'dart:async';

import 'package:flutter/material.dart';
import 'package:JudoRegistration/constants.dart';
import 'package:JudoRegistration/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double hight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;

    DateTime now = DateTime.now();
    double timeline = (hight / 1440) * (now.hour * 60 + now.minute);
    String month = months[now.month - 1];

    Timer? toScreensaver;

    navigateToScreenSaver() {
      toScreensaver!.cancel();
      Navigator.pushNamed(context, Routes.screensaver);
    }

    toScreensaver = Timer.periodic(
        const Duration(minutes: 1), (_) => navigateToScreenSaver());

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,

        leading: IconButton(
          icon: const Icon(Icons.menu, size: 36),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('$month ${now.day}', style: const TextStyle(fontSize: 36.0, ),),
            Text('${now.year}', style: const TextStyle(fontSize: 36.0,),),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.pageSettings);
              },
              icon: const Icon(Icons.settings, size: 36, ))
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: 5,
              top: 10,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Positioned(
              left: 50,
              top: 30,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
            Positioned(
              left: 1,
              top: timeline,
              child: Container(
                width: width,
                height: 2.0,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
