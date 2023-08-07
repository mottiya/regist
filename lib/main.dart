import 'package:flutter/material.dart';
import 'package:bmprogresshud/bmprogresshud.dart';
import 'package:get/get.dart';
import 'package:regist/app/routes/app_pages.dart';
import 'package:regist/helpers/logger/get_logger.dart';
import 'package:regist/services/telegram_service.dart';
import 'package:regist/themes/default_theme.dart';
import 'package:window_manager/window_manager.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await WindowManager.instance.setFullScreen(true);
  Get.put(TelegramService());
  runApp(const RegistApp());
}

class RegistApp extends StatelessWidget {
  const RegistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProgressHud(
      isGlobalHud: true,
      child: GetMaterialApp(
        title: 'Regist',
        debugShowCheckedModeBanner: false,
        enableLog: true,
        logWriterCallback: GetLogger.write,
        theme: DefaultThemeGetter.get(),
        defaultTransition: Transition.cupertino,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
        navigatorObservers: [NavigatorObserver()],
      )
    );
  }
}
