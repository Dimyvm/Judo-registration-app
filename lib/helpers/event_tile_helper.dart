
import 'package:flutter/material.dart';
import '../models/training_event_model.dart';
import '../widgets/event_tile.dart';

// convert the event of day x in a graphical EventTile.
List<Widget> convertTrainingEventToEventTile(List<TrainingEvent> trainingEvents, double timeline, double width, double heightMinAppbar, double scale, VoidCallback cancelTimer ) {

      List<Widget> eventTileList = [];
      
      for (var trainingEvent in trainingEvents) {
          eventTileList.add(
          EventTile(
            color: getColor(trainingEvent), 
            timeline: timeline,
            width: width,
            height: heightMinAppbar,
            start: trainingEvent.dateTimeStart,
            end: trainingEvent.dateTimeEnd,
            title: trainingEvent.group,
            comment: trainingEvent.detail,
            scale: scale,
            callback: cancelTimer));
      }
      return eventTileList;
    }

MaterialColor getColor(TrainingEvent trainingEvent){

  if(trainingEvent.group == "Recreanten"){
    return Colors.orange;
  }
  if(trainingEvent.group == ">=U15"){
    return Colors.purple;
  }
  if(trainingEvent.group == "U9"){
    return Colors.green;
  }
  if(trainingEvent.group == "Team Inchi"){
    return Colors.blue;
  }
  if(trainingEvent.group == "U11/U13"){
    return Colors.red;
  }
  else{
    return Colors.teal;
  }
}