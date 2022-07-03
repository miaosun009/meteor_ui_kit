import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/components.dart';
import 'package:meteor_ui_kit/src/foundation/color_scheme.dart';

@immutable
class UIFontWeightScheme extends ThemeExtension<UIFontWeightScheme> {
  final FontWeight bold;
  final FontWeight medium;
  final FontWeight regular;

  factory UIFontWeightScheme.normal() {
    return const UIFontWeightScheme(
      bold: FontWeight.bold,
      medium: FontWeight.w600,
      regular: FontWeight.w400,
    );
  }

  List<FontWeight> get values => [bold, medium, regular];

  FontWeight? value(UIFontWeight? fontWeight) {
    if (fontWeight != null) {
      return values[fontWeight.index];
    }
    return null;
  }

  const UIFontWeightScheme({
    required this.bold,
    required this.medium,
    required this.regular,
  });

  @override
  ThemeExtension<UIFontWeightScheme> copyWith({
    FontWeight? bold,
    FontWeight? medium,
    FontWeight? regular,
  }) {
    return UIFontWeightScheme(
      bold: bold ?? this.bold,
      medium: medium ?? this.medium,
      regular: regular ?? this.regular,
    );
  }

  @override
  ThemeExtension<UIFontWeightScheme> lerp(
      ThemeExtension<UIFontWeightScheme>? other, double t) {
    return this;
  }

  @override
  noSuchMethod(Invocation invocation) {
    print("5555");
  }
}
