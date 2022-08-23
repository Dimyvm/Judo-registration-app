import 'package:judoregistration/controllers/settings_controller.dart';
import 'package:judoregistration/routes.dart';
import 'package:judoregistration/widgets/show_dialog_to_late_to_soon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventTile extends ConsumerWidget {
  final MaterialColor color;
  final double timeline;
  final double width;
  final DateTime start;
  final DateTime end;
  final String title;
  final String comment;
  final double height;
  final double scale;
  final VoidCallback callback;

  //A representation of a event / training
  const EventTile(
      {Key? key,
      required this.color,
      required this.timeline,
      required this.width,
      required this.height,
      required this.start,
      required this.end,
      required this.title,
      required this.comment,
      required this.scale,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //State management
    final settingsController = ref.watch(settingsControllerProvider);

    ///Convert time in minutes.
    int getTimeInMinutes(DateTime dateTime) {
      return dateTime.hour * 60 + dateTime.minute;
    }

    bool checkIfRegistrationIspossible() {
      //This function help us with registration.
      //you can only registrate for a event from 30min before until 30min after the start.

      DateTime now = DateTime.now();
      int registarTime = settingsController.getRegistrationStartTime();
      int diff = getTimeInMinutes(start) - getTimeInMinutes(now);

      if (diff <= registarTime && diff >= -registarTime) {
        return true;
      } else {
        return false;
      }
    }


    return Positioned(
      left: 0,
      top: ((height / 1440) * getTimeInMinutes(start)) * scale, // start time
      child: GestureDetector(
        onTap: () {
          if (checkIfRegistrationIspossible()) {
            callback(); //Cancel screenSaver timer
            Navigator.pushNamed(context, Routes.registration, arguments: title);
          } else {
            showDialog(
              context: context,
              builder: (_) => const ToLateToSoon(),
            );
          }
        },
        child: Container(
          width: (width / 6) * 5,
          height: (((height / 1440) *
                  (getTimeInMinutes(end) - getTimeInMinutes(start))) *
              scale), //ending time
          decoration: BoxDecoration(
            color: color[100],
            border: Border(
              left: BorderSide(color: color, width: 7),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ), //title
                  Text(
                    comment,
                    style: const TextStyle(fontSize: 18),
                  ) //comment
                ]),
          ),
        ),
      ),
    );
  }
}
