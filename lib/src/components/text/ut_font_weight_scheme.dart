import 'package:flutter/material.dart';

@immutable
class UIFontWeightScheme extends ThemeExtension<UIFontWeightScheme> {
  final FontWeight bold;
  final FontWeight medium;
  final FontWeight regular;
  final FontWeight light;

  factory UIFontWeightScheme.normal() {
    return const UIFontWeightScheme(
      bold: FontWeight.bold,
      medium: FontWeight.w600,
      regular: FontWeight.w400,
      light: FontWeight.w100,
    );
  }

  List<FontWeight> get values => [bold, medium, regular, light];

  const UIFontWeightScheme({
    required this.bold,
    required this.medium,
    required this.regular,
    required this.light,
  });

  @override
  ThemeExtension<UIFontWeightScheme> copyWith({
    FontWeight? bold,
    FontWeight? medium,
    FontWeight? regular,
    FontWeight? light,
  }) {
    return UIFontWeightScheme(
      bold: bold ?? this.bold,
      medium: medium ?? this.medium,
      regular: regular ?? this.regular,
      light: light ?? this.light,
    );
  }

  @override
  ThemeExtension<UIFontWeightScheme> lerp(
      ThemeExtension<UIFontWeightScheme>? other, double t) {
    return this;
  }
}

enum UIFontWeight {
  bold,
  medium,
  regular,
  light,
}
