import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regist/app/modules/other/other_controller.dart';
import 'package:regist/helpers/app_button.dart';
import 'package:regist/helpers/background_container.dart';
import 'package:regist/helpers/image/image_helper.dart';

class OtherView extends GetView<OtherController> {
  const OtherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BackgroundContainer(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: ImageHelper.svgImage(
                      SvgNames.logo,
                      color: Get.theme.colorScheme.primary,
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Обратитесь на ресепшн, для решения вашего вопроса',
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headlineLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: 200),
                ],
              ),
            ),
            Positioned(
              right: 50,
              bottom: 50,
              child: AppButton(
                onPressed: () {
                  Get.back();
                },
                text: 'Главный экран',
                height: 50,
                width: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
