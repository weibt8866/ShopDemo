import 'package:flutter/material.dart';

class NoSplashFactory extends InteractiveInkFeatureFactory {
  InteractiveInkFeature create(
      {required MaterialInkController controller,
      required RenderBox referenceBox,
      Offset? position,
      required Color color,
      TextDirection? textDirection,
      bool containedInkWell = false,
      rectCallback,
      BorderRadius? borderRadius,
      ShapeBorder? customBorder,
      double? radius,
      onRemoved}) {
    return _NoInteractiveInkFeature(
        controller: controller, referenceBox: referenceBox, color: color);
  }
}

class _NoInteractiveInkFeature extends InteractiveInkFeature {
  _NoInteractiveInkFeature(
      {required MaterialInkController controller,
      required RenderBox referenceBox,
      required Color color})
      : super(color: color, controller: controller, referenceBox: referenceBox);

  void paintFeature(Canvas canvas, Matrix4 transform) {}
}

/// 颜色转换16进制
class HexColor extends Color {
  static int res(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(String color) : super(res(color));
}
