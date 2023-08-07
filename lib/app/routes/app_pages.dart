import 'package:get/get.dart';
import 'package:regist/app/modules/home/home_binding.dart';
import 'package:regist/app/modules/home/home_view.dart';
import 'package:regist/app/modules/internship/internship_binding.dart';
import 'package:regist/app/modules/internship/internship_view.dart';
import 'package:regist/app/modules/interview/interview_binding.dart';
import 'package:regist/app/modules/interview/interview_view.dart';
import 'package:regist/app/modules/meeting/meeting_binding.dart';
import 'package:regist/app/modules/meeting/meeting_view.dart';
import 'package:regist/app/modules/other/other_binding.dart';
import 'package:regist/app/modules/other/other_view.dart';

part 'app_routes.dart';

abstract class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBindings(),
      children: [
        GetPage(
          name: _Paths.interview,
          page: () => const InterviewView(),
          binding: InterviewBindings(),
        ),
        GetPage(
          name: _Paths.other,
          page: () => const OtherView(),
          binding: OtherBindings(),
        ),
        GetPage(
          name: _Paths.internship,
          page: () => const IntershipView(),
          binding: InternshipBindings(),
        ),
        GetPage(
          name: _Paths.meeting,
          page: () => const MeetingView(),
          binding: MeetingBindings(),
        ),
      ],
    ),

    // GetPage(
    //   name: _Paths.onboarding,
    //   page: () => OnboardingView(),
    // ),
    // GetPage(
    //   name: _Paths.articles,
    //   page: () => ArticlesView(),
    //   binding: ArticlesBindings(),
    //   children: [
    //     GetPage(
    //       name: _Paths.article,
    //       binding: ArticleBindings(),
    //       page: () => ArticleView(),
    //     ),
    //   ],
    // ),
    // GetPage(
    //   name: _Paths.agreement,
    //   page: () => AgreementView(),
    // ),
    // GetPage(
    //   name: _Paths.noConnection,
    //   page: () => NoConnectionView(),
    // ),
    // GetPage(
    //   name: _Paths.settings,
    //   page: () => const SettingsView(),
    // )
  ];
}
