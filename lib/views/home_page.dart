
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:JudoRegistration/constants.dart';
import 'package:JudoRegistration/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double hight = MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top;
    
    DateTime now = DateTime.now();
    double timeline = (hight / 1440) * (now.hour*60 + now.minute);

    Timer? toScreensaver;

    navigateToScreenSaver(){
      toScreensaver!.cancel();
      Navigator.pushNamed(context, Routes.pageSettings);
    }

    toScreensaver = Timer.periodic(const Duration(minutes: 1), (_) =>  navigateToScreenSaver());
    

    
    

    return Scaffold(

      appBar: AppBar(
        
        title: Text(appTitle),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){Navigator.pushNamed(context, Routes.pageSettings);}, icon: const Icon(Icons.settings))
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
              top: timeline ,
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