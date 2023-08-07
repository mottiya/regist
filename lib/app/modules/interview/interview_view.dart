import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regist/app/modules/interview/interview_controller.dart';
import 'package:regist/helpers/app_button.dart';
import 'package:regist/helpers/background_container.dart';
import 'package:regist/helpers/image/image_helper.dart';
import 'package:regist/helpers/custom_keyboard.dart';
import 'package:regist/services/telegram_service.dart';

class InterviewView extends GetView<InterviewController> {
  const InterviewView({super.key});

  String? _validateName(String name) {
    if (name.length < 3 || name.isEmpty) {
      return 'Слишком короткое имя';
    }
    if (name.length > 50) {
      return 'Слишком длинное имя';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BackgroundContainer(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      ImageHelper.svgImage(
                        SvgNames.logo,
                        color: Get.theme.colorScheme.primary,
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(width: 70),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            'Собеседование',
                            style: Get.textTheme.displayLarge,
                          ),
                        ),
                      )
                    ],
                  ),
                  Obx(() => (controller.step.value == 0)
                      ? const SizedBox(height: 100)
                      : const SizedBox.shrink()),
                  Obx(
                    () => (controller.step.value == 0)
                        ? Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Введите свое имя',
                                  style: Get.textTheme.headlineLarge,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      width: double.infinity,
                                      child: Obx(
                                        () => TextFormField(
                                          decoration: InputDecoration(
                                              errorStyle:
                                                  Get.textTheme.labelSmall,
                                              errorText:
                                                  controller.errorText.value,
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              fillColor: Get
                                                  .theme.colorScheme.background,
                                              filled: true,
                                              errorBorder:
                                                  const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      borderSide: BorderSide(
                                                          color: Colors.red))),
                                          style: Get.textTheme.labelMedium,
                                          autofocus: true,
                                          focusNode: controller.textFocus,
                                          cursorColor: Get
                                              .theme.colorScheme.onBackground,
                                          cursorWidth: 3,
                                          textAlignVertical:
                                              const TextAlignVertical(y: -1),
                                          onChanged: (value) =>
                                              {controller.name = value},
                                          controller: controller.textController,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 40),
                                  AppButton(
                                    onPressed: () {
                                      controller.errorText.value =
                                          _validateName(
                                              controller.textController.text);
                                      if (controller.errorText.value == null) {
                                        controller.name =
                                            controller.textController.text;
                                        controller.telegramService.send(
                                            textFormatt:
                                                MessageFormat.interview,
                                            name: controller.name);
                                        controller.step.value += 1;
                                      }
                                    },
                                    height: 50,
                                    width: 300,
                                    text: 'Далее',
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                3,
                                (index) {
                                  const textList = [
                                    'Пожалуйста, возьмите анкету на стойке справа',
                                    'Пройдите в клиентский зал и заполните её',
                                    'Наш специалист подойдет к вам в течение 5 минут'
                                  ];
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(75)),
                                              color:
                                                  Get.theme.colorScheme.primary,
                                            ),
                                            child: Center(
                                              child: Text(
                                                (index + 1).toString(),
                                                style: Get
                                                    .textTheme.headlineMedium!
                                                    .copyWith(
                                                        color: Get
                                                            .theme
                                                            .colorScheme
                                                            .secondary),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Text(
                                            textList[index],
                                            style: Get.textTheme.headlineMedium,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                  ),
                  Obx(
                    () => (controller.step.value == 0)
                        ? const SizedBox(height: 40)
                        : const SizedBox(height: 200),
                  ),
                  Obx(
                    () => (controller.step.value == 0)
                        ? Expanded(
                            child: CustomKeyboard(
                              isCaps: controller.isCaps,
                              width: double.infinity,
                              height: double.infinity,
                              onChanged: () {
                                controller.errorText.value = null;
                              },
                              onSubmit: () => {},
                              backgroundColor: Get.theme.colorScheme.background,
                              fontPadding: 5,
                              buttonBorderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              buttonColor: Get.theme.colorScheme.primary,
                              textstyle: Get.textTheme.labelMedium!.copyWith(
                                  color: Get.theme.colorScheme.secondary),
                              controller: controller.textController,
                              focus: controller.textFocus,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
            Obx(
              () => (controller.step.value == 0)
                  ? Positioned(
                      left: 10,
                      top: 10,
                      child: AppButton(
                        onPressed: () {
                          Get.back();
                        },
                        text: '',
                        icon: Icon(
                          Icons.arrow_back,
                          color: Get.theme.colorScheme.secondary,
                          size: 40,
                        ),
                        height: 40,
                        width: 40,
                        radius: 20,
                      ),
                    )
                  : Positioned(
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
            )
          ],
        ),
      ),
    );
  }
}
