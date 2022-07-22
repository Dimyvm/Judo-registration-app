
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsControllerProvider =  ChangeNotifierProvider<SettingsController>((ref) {
  return SettingsController ();
});

class SettingsController extends ChangeNotifier{

  int _screensaverTime = 5;  
  int _registrationStartTime = 30;
  int _loadingAPIData = 5;
  bool _loadingAvatarPictures = false;


  //ScreensaverTime
  int getScreensaverTime() {
    return _screensaverTime;
  }

  setScreensaverTime(int min){
    _screensaverTime = min;
    notifyListeners();
  }

  //registrationStartTime
  int getRegistrationStartTime(){
    return _registrationStartTime;
  }

  setRegistrationStartTime(int min){
    _registrationStartTime = min;
    notifyListeners();
  }

  //loading API data
  int getAPIdataEachTime(){
    return _loadingAPIData;
  }

  setAPIdataEachTime(int min){
    _loadingAPIData = min;
    notifyListeners();
  }

  //loading avatar Pictures
  bool loadingAvatarPicturs(){
    return _loadingAvatarPictures;
  }

  setLoadingAvatarPictures(bool value){
    _loadingAvatarPictures = value;
    notifyListeners();
  }
}