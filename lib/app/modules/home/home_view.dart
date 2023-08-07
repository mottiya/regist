import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regist/app/modules/home/home_controller.dart';
import 'package:regist/app/routes/app_pages.dart';
import 'package:regist/helpers/app_button.dart';
import 'package:regist/helpers/background_container.dart';
import 'package:regist/helpers/image/image_helper.dart';
import 'package:regist/services/telegram_service.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(children: [
            // const Spacer(),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        const Spacer(),
                        ImageHelper.svgImage(
                          SvgNames.logo,
                          color: Get.theme.colorScheme.primary,
                          height: 320,
                          width: 320,
                        ),
                        const SizedBox(height: 20),
                        FittedBox(
                          child: Text(
                            'Единый Центр Недвижимости',
                            style: Get.textTheme.displayLarge,
                            textAlign: TextAlign.center,
                            softWrap: false,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                  const SizedBox(width: 70),
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        'Здравствуйте! Выберите цель вашего визита:',
                        textAlign: TextAlign.center,
                        style: Get.textTheme.displayLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const Spacer(),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppButton(
                      text: 'Встреча',
                      onPressed: () => Get.toNamed(Routes.meeting),
                    ),
                    const Spacer(),
                    AppButton(
                      text: 'Собеседование',
                      onPressed: () => Get.toNamed(Routes.interview),
                    ),
                    const Spacer(),
                    AppButton(
                      text: 'Стажировка',
                      onPressed: () {
                        controller.telegramService
                            .send(textFormatt: MessageFormat.internship);
                        Get.toNamed(Routes.internship);
                      },
                    ),
                    const Spacer(),
                    AppButton(
                      text: 'Другое',
                      onPressed: () => Get.toNamed(Routes.other),
                    ),
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}
