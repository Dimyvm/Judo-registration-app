
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingsControllerProvider =  ChangeNotifierProvider<SettingsController>((ref) {
  return SettingsController();
});


class SettingsController extends ChangeNotifier{

  int _screensaverTime = 5;  
  int _registrationStartTime = 30;
  int _loadingAPIData = 5;
  bool _loadingAvatarPictures = false;
  static late SharedPreferences prefs;

  static init() async{
    prefs = await SharedPreferences.getInstance(); 
  }

  //ScreensaverTime
  int getScreensaverTime() {
    _screensaverTime = prefs.getInt('screensaverTime') ?? 5;
    return _screensaverTime;
  }

  setScreensaverTime(int min){
    _screensaverTime = min;
    prefs.setInt('screensaverTime', min);
    notifyListeners();
  }

  //registrationStartTime
  int getRegistrationStartTime() {
    _registrationStartTime = prefs.getInt('registrationStartTime') ?? 30;
    return _registrationStartTime;
  }

  setRegistrationStartTime(int min){
    _registrationStartTime = min;
    prefs.setInt('registrationStartTime', min);
    notifyListeners();
  }

  //loading API data
  int getAPIdataEachTime(){
    _loadingAPIData = prefs.getInt('loadingAPIData') ?? 5;
    return _loadingAPIData;
  }

  setAPIdataEachTime(int min){
    _loadingAPIData = min;
    prefs.setInt('loadingAPIData', min);
    notifyListeners();
  }

  //loading avatar Pictures
  bool loadingAvatarPicturs() {
    _loadingAvatarPictures = prefs.getBool('loadingAvatarPictures') ?? false;
    return _loadingAvatarPictures;
  }

  setLoadingAvatarPictures(bool value){
    _loadingAvatarPictures = value;
    prefs.setBool('loadingAvatarPictures', value);    
    notifyListeners();
  }
}