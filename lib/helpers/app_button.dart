import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    this.width = 300,
    this.height = 150,
    this.onPressed,
    this.color,
    this.radius = 10,
    this.icon,
    this.textStyle,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final double width;
  final double height;
  final String text;
  final TextStyle? textStyle;
  final Icon? icon;
  final Color? color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color ?? Get.theme.colorScheme.primary,
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          child: InkWell(
            onTap: onPressed,
            child: Center(
              child: FittedBox(
                fit: BoxFit.cover,
                child: (icon == null)
                    ? Text(
                        text,
                        style: textStyle ?? Get.textTheme.displayMedium,
                        textAlign: TextAlign.center,
                      )
                    : icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
