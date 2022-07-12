import 'package:JudoRegistration/routes.dart';
import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
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
  Widget build(BuildContext context) {

    ///Convert time in minutes.
    int getTimeInMinutes(DateTime dateTime) {
      return dateTime.hour * 60 + dateTime.minute;
    }

    bool checkIfRegistrationIspossible(){
      //This function help us with registration.
      //you can only registrate for a event from 30min before until 30min after the start.

      DateTime now = DateTime.now();
      int registarTime = 30;
      int diff = getTimeInMinutes(start) - getTimeInMinutes(now);
      
      
      if(diff <= registarTime && diff >= -registarTime){
        return true; 
      }else{
        return false;
      }
    }



    return Positioned(
      left: 0,
      top: ((height / 1440) * getTimeInMinutes(start)) * scale,  // start time
      child: GestureDetector(
        onTap: () {
          if(checkIfRegistrationIspossible())
          {
              callback();
          Navigator.pushNamed(context, Routes.registration);
          }else{

            print('niet mogelijk om te registreren');
          }
          
        },
        child: Container(
          width: (width / 6) * 5,
          height: (((height / 1440) * (getTimeInMinutes(end) - getTimeInMinutes(start))) * scale), //ending time
          decoration: BoxDecoration(
            color: color[100],
            border: Border(
              left: BorderSide(color: color, width: 7),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),  //title
              Text(comment,style: const TextStyle(fontSize: 18),) //comment
            ]),
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () { },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("My title"),
    content: const Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
