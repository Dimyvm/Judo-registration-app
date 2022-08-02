import 'package:JudoRegistration/models/member_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/training_event_model.dart';

class ApiController {
  static List<Member> memberList = [];
  static List<TrainingEvent> trainingEvent = [];
  static var url = Uri(
      scheme: 'https',
      host: 'script.google.com',
      path:
          '/macros/s/AKfycbxc5CQsShnvGNhT2lJqBarOSvydevUDmQs6OtM328S-AHiLgGi1LKBxabZgsiclEjKv/exec');

  // get data
  static getListEeventTile() async {
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // convert response in JSON format
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;

        //convert JSON Trainings data in model.
        var jsonTraining = jsonResponse['Trainings'] as List;
        trainingEvent = List<TrainingEvent>.from(
            jsonTraining.map((model) => TrainingEvent.fromJson(model)));

        //convert JSON member data in model.
        var jsonmembers = jsonResponse['Leden'] as List;
        memberList = List<Member>.from(
            jsonmembers.map((model) => Member.fromJson(model)));

        debugPrint(
            'length of trainingslist ${trainingEvent.length.toString()}');
        debugPrint(
            'Start time : ${trainingEvent[15].dateTimeStart.toString()}');
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

// get members per by category

// register members training

}
