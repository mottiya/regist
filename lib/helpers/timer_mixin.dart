import 'dart:async';

mixin TimerMixin{
  late final Function() timerCalback;
  final timerDuration = 120;

  Timer get getTimer => Timer(Duration(seconds: timerDuration), timerCalback); 
}