part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  // Splash module - app initialization there
  static const splash = _Paths.splash;

  static const onboarding = _Paths.onboarding;

  // Home screen
  static const home = _Paths.home;

  //Next screens
  static const interview = '$home${_Paths.interview}';
  static const meeting = '$home${_Paths.meeting}';
  static const internship = '$home${_Paths.internship}';
  static const other = '$home${_Paths.other}';

  static const noConnection = _Paths.noConnection;
}

abstract class _Paths {
  static const splash = '/';

  static const onboarding = '/onboarding';

  static const home = '/home';

  static const interview = '/interview';
  static const meeting = '/meeting';
  static const internship = '/internship';
  static const other = '/other';

  static const noConnection = '/no-conection';
}
