import 'dart:async';
import 'package:get/get.dart';
import 'package:regist/helpers/timer_mixin.dart';

class InternshipController extends GetxController with TimerMixin {
  Timer? timer;

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    timerCalback = () {
      Get.back();
    };
    timer = getTimer;
  }
}
