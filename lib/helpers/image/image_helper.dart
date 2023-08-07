import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'image_names.dart';

/// Хелпер для получения изображений
class ImageHelper {
  // Путь до папки с изображениями
  static const String _pathToImageAssets = 'assets/images';

  static Widget svgImage(
    String name, {
    Color? color,
    double? width,
    double? height,
  }) {
    try {
      return SvgPicture.asset(
        '$_pathToImageAssets/$name.svg',
        // ignore: deprecated_member_use
        color: color,
        width: width,
        height: height,
      );
    } catch (e) {
      return Container();
    }
  }

  /// Получить путь до изображения
  static String getImagePath(String name) {
    return '$_pathToImageAssets/$name.png';
  }

  /// Получить картинку как Image()
  static Image getImage(String name, {double? width, double? height, BoxFit? fit}) {
    return Image(
      width: width,
      height: height,
      image: AssetImage('$_pathToImageAssets/$name.png'),
      fit: fit,
    );
  }

  /// Получить картинку как AssetImage()
  static AssetImage getAssetImage(String name) {
    return AssetImage('$_pathToImageAssets/$name.png');
  }

  /// Get Uint8List from asset image
  static Future<Uint8List> getBytesFromAsset({
    required String name,
    required int width,
  }) async {
    ByteData data = await rootBundle.load(
      '$_pathToImageAssets/$name.png',
    );
    Codec codec = await instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(
      format: ImageByteFormat.png,
    ))!
        .buffer
        .asUint8List();
  }
}
