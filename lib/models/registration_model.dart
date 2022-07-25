
import 'package:JudoRegistration/models/member_model.dart';
import 'package:JudoRegistration/models/training_event_model.dart';

class Registration{

  final DateTime registrationDateTime;
  final TrainingEvent trainingEvent;
  final Member member;

  Registration({required this.registrationDateTime, required this.trainingEvent, required this.member});

}