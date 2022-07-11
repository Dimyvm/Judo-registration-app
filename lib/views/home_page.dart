import 'dart:async';
import 'package:JudoRegistration/widgets/event_tile.dart';
import 'package:flutter/material.dart';

import 'package:JudoRegistration/constants.dart';
import 'package:JudoRegistration/routes.dart';
import 'package:intl/intl.dart';

import '../widgets/day_view.dart';
import '../widgets/time_line_stroke.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double heightMinAppbar = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    debugPrint('height homepage: $heightMinAppbar');

    DateTime now = DateTime.now();
    double timeline = (heightMinAppbar / 1440) * (now.hour * 60 + now.minute);

    String month = months[now.month - 1];
    double scale = 3;

    Timer? toScreensaver;

    DateFormat('hh:mm').format(DateTime(2020, 1, 1, 1, 10));

    navigateToScreenSaver() {
      toScreensaver!.cancel();
      Navigator.pushNamed(context, Routes.screensaver);
    }

    toScreensaver = Timer.periodic(
        const Duration(minutes: 1), (_) => navigateToScreenSaver());

    List<Widget> events = [
      EventTile(
          height: heightMinAppbar,
          color: Colors.purple,
          timeline: timeline,
          width: width,
          start: DateTime(2022, 6, 28, 20, 45),
          end: DateTime(2022, 6, 28, 21, 45),
          title: "title",
          comment: "comment",
          scale: 3,),
      EventTile(
          height: heightMinAppbar,
          color: Colors.orange,
          timeline: timeline,
          width: width,
          start: DateTime(2022, 6, 28, 8, 45),
          end: DateTime(2022, 6, 28, 10, 45),
          title: "title",
          comment: "comment",
          scale: 3,),
    ];
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
            //moving Background layer - previous day
            DayView(
              day: -1,
              heightMinAppbar: heightMinAppbar,
              width: width,
              scale: scale,
              timeline: timeline,
              
            ),
            // moving Background layer - current day
            DayView(
              day: 1,
              heightMinAppbar: heightMinAppbar,
              width: width,
              scale: scale,
              timeline: timeline,
              events: events,
            ),
            // moving Background layer - next day
            DayView(
              heightMinAppbar: heightMinAppbar,
              width: width,
              scale: scale,
              timeline: timeline,
              events: events,
            ),
            
            //timeline
            Positioned(
              left: 1,
              // top: timeline,   // moving timeline
              top: heightMinAppbar / 2, // fixed timeline
              child: Container(
                width: width,
                height: 3.0,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
