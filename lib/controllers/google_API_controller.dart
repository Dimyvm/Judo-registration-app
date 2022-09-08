
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:judoregistration/constants.dart';
import 'package:judoregistration/models/member_model.dart';
import 'package:judoregistration/models/registration_model.dart';
import '../models/training_event_model.dart';
import 'package:judoregistration/extentions.dart';


final apiControllerProvider =  ChangeNotifierProvider<ApiController>((ref) {
  return ApiController();
});

class ApiController extends ChangeNotifier{
   List<Member> _memberList = [];
   List<TrainingEvent> _trainingEvent = [];

  // get data
   getDatafromAPI() async {
    try {
      var response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        // convert response in JSON format
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;

        //convert JSON Trainings data in model.
        var jsonTraining = jsonResponse['Trainings'] as List;
        _trainingEvent = List<TrainingEvent>.from(jsonTraining.map((model) => TrainingEvent.fromJson(model)));

        //convert JSON member data in model.
        var jsonmembers = jsonResponse['Leden'] as List;
        _memberList = List<Member>.from(jsonmembers.map((model) => Member.fromJson(model)));

        notifyListeners();

      } else {
        debugPrint('Get Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  // get members per by category
  List<Member> getMembersByGroup(String group){
    List<Member> filterMemberListByGroup = _memberList.where((element) => element.group == group).toList();
  
    return filterMemberListByGroup;
  }

  // get list EventTile for a specific day
  List<TrainingEvent> getListEventTile(int day){
    // This function will return a List of EventTile for a specific day.
    // int day 0 = current day, -1 = previous day, 1 = is the next day. 
    DateTime currentDate = DateTime.now();
    return _trainingEvent.where((element) => element.dateTimeStart.isSameDate(currentDate)== true).toList();
  }

  // get active trainingEvent --> now.
  TrainingEvent getActiveTraining(){
    DateTime currentTime = DateTime.now();
    List<TrainingEvent> trainingEventListToday =  getListEventTile(0);
 
    var currentTraining = trainingEventListToday.firstWhere((element) => element.dateTimeStart.isBefore(currentTime) && element.dateTimeEnd.isAfter(currentTime));
    return currentTraining;
  }

  // register members training
  Future<bool> postDataToApi(Member member) async {
    DateTime registrationDateTime = DateTime.now();
    TrainingEvent trainingEvent = getActiveTraining();
    Registration registration = Registration(member: member,registrationDateTime: registrationDateTime, trainingEvent: trainingEvent);
    try {
      var response = await http.post(apiUrl, body: jsonEncode(registration.toJson()));
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 302) {

        // convert response in JSON format
        var jsonResponse = convert.jsonEncode(response.body);

        debugPrint(jsonResponse.toString());
        return true;
      }
      else{
        // convert response in JSON format
        var jsonResponse = convert.jsonEncode(response.body);

        debugPrint(jsonResponse.toString());
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
