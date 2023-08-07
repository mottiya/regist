import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({
    super.key,
    required this.height,
    required this.width,
    required this.onChanged,
    required this.backgroundColor,
    this.textCascade = const LanguageCascade(),
    required this.borderRadius,
    required this.onSubmit,
    required this.controller,
    required this.isCaps,
    this.textstyle,
    this.buttonColor,
    this.buttonBorderRadius,
    this.fontPadding,
    this.focus,
  });

  final double height; //
  final double width; //
  final Function onChanged;
  final Function onSubmit;
  final TextEditingController controller;
  final TextStyle? textstyle;
  final Color? buttonColor; //
  final Color backgroundColor; //
  final double? fontPadding; //
  final BorderRadiusGeometry borderRadius; //
  final BorderRadiusGeometry? buttonBorderRadius; //
  final LanguageCascade textCascade;
  final FocusNode? focus;
  final RxBool isCaps;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: backgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(fontPadding ?? 0),
        child: Column(
          children: List.generate(
            textCascade.cascade.length,
            (indexRow) {
              return Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: List.generate(
                          textCascade.cascade[indexRow].length,
                          (indexColumn) {
                            return Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: KeyboardButton(
                                      isCaps: isCaps,
                                      controller: controller,
                                      height: double.infinity,
                                      width: double.infinity,
                                      color: buttonColor,
                                      text: textCascade.cascade[indexRow]
                                          [indexColumn],
                                      borderRadius: buttonBorderRadius,
                                      textstyle: textstyle,
                                      onPressed: () {
                                        if (!(focus?.hasFocus ?? true)) {
                                          focus!.requestFocus();
                                        }
                                        onChanged();
                                      },
                                    ),
                                  ),
                                  (indexColumn !=
                                          (textCascade
                                                  .cascade[indexRow].length -
                                              1))
                                      ? SizedBox(width: fontPadding)
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    (indexRow != textCascade.cascade.length - 1)
                        ? SizedBox(height: fontPadding)
                        : const SizedBox.shrink(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class KeyboardButton extends StatelessWidget {
  const KeyboardButton({
    super.key,
    required this.onPressed,
    required this.height,
    required this.width,
    required this.text,
    this.textstyle,
    this.color,
    this.borderRadius,
    required this.controller,
    required this.isCaps,
  });

  final VoidCallback onPressed;
  final double width;
  final double height;
  final String text;
  final TextStyle? textstyle;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final TextEditingController controller;
  final RxBool isCaps;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        borderRadius: borderRadius,
      ),
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          child: InkWell(
            onTap: () {
              if (text == '-') {
                if (controller.text.length == 1) {
                  controller.text = '';
                } else {
                  if (controller.text.isNotEmpty) {
                    controller.text = controller.text
                        .substring(0, controller.text.length - 1);
                  }
                }
              } else {
                if (text == '_') {
                  controller.text += ' ';
                } else {
                  controller.text += (controller.text.isEmpty ||
                          controller.text[controller.text.length - 1] == ' ')
                      ? text.toUpperCase()
                      : text;
                }
              }
              if (controller.text.isEmpty ||
                  controller.text[controller.text.length - 1] == ' ') {
                isCaps.value = true;
              } else {
                isCaps.value = false;
              }
              onPressed();
            },
            child: Center(
              child: FittedBox(
                fit: BoxFit.cover,
                child: (text != '-')
                    ? Obx(
                        () => Text(
                          (isCaps.value) ? text.toUpperCase() : text,
                          style: textstyle,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Icon(
                        Icons.backspace,
                        color: textstyle?.color,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LanguageCascade {
  const LanguageCascade({this.cascade = defaultRussianLayout});

  final List<List> cascade;
}

const List<List> defaultRussianLayout = [
  // Row 1
  // ['1','2','3','4','5','6','7','8','9','0',],
  [
    'й',
    'ц',
    'у',
    'к',
    'е',
    'н',
    'г',
    'ш',
    'щ',
    'з',
    'х',
  ],
  [
    'ф',
    'ы',
    'в',
    'а',
    'п',
    'р',
    'о',
    'л',
    'д',
    'ж',
    'э',
  ],
  [
    'я',
    'ч',
    'с',
    'м',
    'и',
    'т',
    'ь',
    'б',
    'ю',
    'ъ',
    '-',
  ],
  [
    '_',
  ]
];
