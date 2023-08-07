import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regist/helpers/timer_mixin.dart';
import 'package:regist/services/telegram_service.dart';

class MeetingController extends GetxController with TimerMixin{
  final telegramService = Get.find<TelegramService>();
  late bool isAgent;
  String? name;
  final step = 0.obs;
  final isCaps = true.obs;
  final textController = TextEditingController();
  final textFocus = FocusNode();
  final Rx<String?> errorText = Rx<String?>(null);
  Timer? timer;

  @override
  void onClose() {
    textController.dispose();
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
    textFocus.addListener(() {
      _printLatestValue;
    });
  }

  void _printLatestValue() {
    // ignore: avoid_print
    print(textController.text);
  }
}
