import 'package:get/get.dart';
import 'package:regist/app/modules/other/other_controller.dart';

class OtherBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OtherController());
  }
}