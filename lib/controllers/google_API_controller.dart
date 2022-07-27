
// gsheets 
//implementation id: AKfycbx39qXu32ckbRVQOttym4ldbAV2SIwOuMDk8P3jQFgSB5MXZlboJCOGao-v-z1y2ZFR
// https://script.google.com/macros/s/AKfycbx39qXu32ckbRVQOttym4ldbAV2SIwOuMDk8P3jQFgSB5MXZlboJCOGao-v-z1y2ZFR/exec


import 'package:JudoRegistration/models/member_model.dart';
import 'package:JudoRegistration/widgets/event_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class apiController{

  List<Member> memberList = [];
  List<EventTile> eventsList = [];
  static const String URL = 'https://script.google.com/macros/s/AKfycbx39qXu32ckbRVQOttym4ldbAV2SIwOuMDk8P3jQFgSB5MXZlboJCOGao-v-z1y2ZFR/exec';

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";
  
  // get training data
  getListEeventTile() async{
    try {
       var response = await http.get(URL);
       if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        var itemCount = jsonResponse['totalItems'];
        print('Number of books about http: $itemCount.');
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


