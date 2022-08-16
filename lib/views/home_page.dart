import 'dart:async';
import 'package:flutter/material.dart';
import 'package:JudoRegistration/constants.dart';
import 'package:JudoRegistration/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../controllers/google_API_controller.dart';
import '../controllers/settings_controller.dart';
import '../helpers/event_tile_helper.dart';
import '../widgets/day_view.dart';

class HomePage extends ConsumerWidget {
  ///Homeview
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State management
    final settingsController = ref.watch(settingsControllerProvider);
    final apiController = ref.watch(apiControllerProvider);

    //height of the screen - Appbar height
    final double width = MediaQuery.of(context).size.width;
    final double heightMinAppbar = (MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top);

    DateTime now = DateTime.now(); // Current DateTime
    double timeline = (heightMinAppbar / 1440) *
        (now.hour * 60 +
            now.minute); // net height of screen in relation to one day in minutes

    String month =
        months[now.month - 1]; //current month in String for the Appbar.
    double scale =
        3; // to show all larger or smaller, but in the right proportions.

    Timer? toScreensaver; // A timer to navigate to videoScreensaver.

    DateFormat('hh:mm').format(DateTime(2020, 1, 1, 1, 10));

    //stop timer
    cancelTimer() {
      toScreensaver!.cancel();
      debugPrint('timer is stopt');
    }

    //navigation to screensaver
    navigateToScreenSaver() {
      cancelTimer();
      Navigator.pushNamed(context, Routes.screensaver);
    }

    //Start Timer.
    toScreensaver = Timer.periodic(
      Duration(minutes: settingsController.getScreensaverTime()),
      (_) => navigateToScreenSaver(),
    );



    return Scaffold(
      appBar: AppBar(
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
                cancelTimer();
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
              events: convertTrainingEventToEventTile(apiController.getListEventTile(-1),timeline, width, heightMinAppbar, scale, cancelTimer,),
            ),
            // moving Background layer - current day
            DayView(
              day: 1,
              heightMinAppbar: heightMinAppbar,
              width: width,
              scale: scale,
              timeline: timeline,
              events: convertTrainingEventToEventTile(apiController.getListEventTile(0),timeline, width, heightMinAppbar, scale, cancelTimer,),
              
            ),
            // moving Background layer - next day
            DayView(
              heightMinAppbar: heightMinAppbar,
              width: width,
              scale: scale,
              timeline: timeline,
              events: convertTrainingEventToEventTile(apiController.getListEventTile(1),timeline, width, heightMinAppbar, scale, cancelTimer,),
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
