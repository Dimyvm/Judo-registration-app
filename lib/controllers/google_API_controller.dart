
// gsheets 
//implementation id: AKfycbx39qXu32ckbRVQOttym4ldbAV2SIwOuMDk8P3jQFgSB5MXZlboJCOGao-v-z1y2ZFR
// https://script.google.com/macros/s/AKfycbxc5CQsShnvGNhT2lJqBarOSvydevUDmQs6OtM328S-AHiLgGi1LKBxabZgsiclEjKv/exec


import 'package:JudoRegistration/models/member_model.dart';
import 'package:JudoRegistration/widgets/event_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class apiController{

  List<Member> memberList = [];
  List<EventTile> eventsList = [];
  static var url = Uri(scheme:'https', host: 'script.google.com', path: '/macros/s/AKfycbxc5CQsShnvGNhT2lJqBarOSvydevUDmQs6OtM328S-AHiLgGi1LKBxabZgsiclEjKv/exec');
  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";
  
  // get training data
  static getListEeventTile() async{
    try {
       var response = await http.get(url);
       if (response.statusCode == 200) {
        
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        debugPrint(jsonResponse.toString());
        // var itemCount = jsonResponse['totalItems'];
        // print('Number of books about http: $itemCount.');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    }

  }




// get members per by category



// register members training

}


