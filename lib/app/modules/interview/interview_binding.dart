import 'package:get/get.dart';
import 'package:regist/app/modules/interview/interview_controller.dart';

class InterviewBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(InterviewController());
  }
}