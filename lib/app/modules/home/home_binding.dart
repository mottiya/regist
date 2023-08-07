import 'package:get/get.dart';
import 'package:regist/app/modules/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}