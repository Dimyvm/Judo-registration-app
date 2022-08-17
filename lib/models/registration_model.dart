
import 'package:judoregistration/models/member_model.dart';
import 'package:judoregistration/models/training_event_model.dart';

class Registration{

  final DateTime registrationDateTime;
  final TrainingEvent trainingEvent;
  final Member member;

  Registration({required this.registrationDateTime, required this.trainingEvent, required this.member});


}