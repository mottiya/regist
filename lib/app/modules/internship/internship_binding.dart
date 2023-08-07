import 'package:get/get.dart';
import 'package:regist/app/modules/internship/internship_controller.dart';

class InternshipBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(InternshipController());
  }
}