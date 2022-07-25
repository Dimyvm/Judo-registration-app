
// gsheets 
//implementation id: AKfycbw7Eg82aoMsrm0___j2poFME_w_DchQxM_CjBITIjYHXWunxboKuWKyLHqkgs6CXRbn
// https://script.google.com/macros/s/AKfycbw7Eg82aoMsrm0___j2poFME_w_DchQxM_CjBITIjYHXWunxboKuWKyLHqkgs6CXRbn/exec


import 'package:JudoRegistration/models/member_model.dart';
import 'package:JudoRegistration/widgets/event_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class apiController{

  List<Member> memberList = [];
  List<EventTile> eventsList = [];
  static const String URL = 'https://script.google.com/macros/s/AKfycbw7Eg82aoMsrm0___j2poFME_w_DchQxM_CjBITIjYHXWunxboKuWKyLHqkgs6CXRbn/exec';

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


