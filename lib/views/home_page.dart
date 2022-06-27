import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:JudoRegistration/constants.dart';
import 'package:JudoRegistration/routes.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_line.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;

    DateTime now = DateTime.now();
    double timeline = (height / 1440) * (now.hour * 60 + now.minute);

    String month = months[now.month - 1];

    Timer? toScreensaver;

    DateFormat('hh:mm').format(DateTime(2020, 1, 1, 1, 10));

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
            Text(
              '$month ${now.day}',
              style: const TextStyle(
                fontSize: 36.0,
              ),
            ),
            Text(
              '${now.year}',
              style: const TextStyle(
                fontSize: 36.0,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.pageSettings);
              },
              icon: const Icon(
                Icons.settings,
                size: 36,
              ))
        ],
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // moving Background layer
            Positioned(
              top: -(timeline * 3 - (height / 2)), // moving background
              child: Row(
                children: [
                  Container(
                    color: Colors.white,
                    width: width / 6,
                    height: height * 3,
                    child: ListView.builder(
                      itemCount: 24,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              // height: height/24,
                              height: height / 8,
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 15,
                                    child: CustomPaint(
                                      foregroundPainter: CustomLinePainter(
                                          color: const Color(0xff8B8B8D),
                                          width: 0.25),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 15,
                                    child: CustomPaint(
                                      foregroundPainter: CustomLinePainter(
                                          color: const Color(0xff8B8B8D),
                                          width: 0.5),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 15,
                                    child: CustomPaint(
                                      foregroundPainter: CustomLinePainter(
                                          color: const Color(0xff8B8B8D),
                                          width: 0.25),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: -7.5,
                              child: Center(
                                child: Text(DateFormat('Hm').format(
                                    DateTime(2020, 1, 1, index + 1, 00))),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    width: (width / 6) * 5,
                    height: height * 3,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //timeline

            Positioned(
              left: 1,
              // top: timeline,   // moving timeline
              top: height / 2, // fixed timeline
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
