import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.secondary,
      ),
      child: child,
    );
  }
}