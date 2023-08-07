import 'package:get/get.dart';
import 'package:regist/app/modules/meeting/meeting_controller.dart';

class MeetingBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MeetingController());
  }
}