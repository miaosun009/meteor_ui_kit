import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/src/foundation/color_scheme.dart';

@immutable
class UIFontSizeScheme extends ThemeExtension<UIFontSizeScheme> {
  final double h1;
  final double h2;
  final double h3;
  final double h4;

  factory UIFontSizeScheme.normal() {
    return const UIFontSizeScheme(
      h1: 24,
      h2: 22,
      h3: 18,
      h4: 16,
    );
  }

  const UIFontSizeScheme({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
  });

  @override
  ThemeExtension<UIFontSizeScheme> copyWith({
    double? h1,
    double? h2,
    double? h3,
    double? h4,
  }) {
    return UIFontSizeScheme(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      h4: h4 ?? this.h4,
    );
  }

  @override
  ThemeExtension<UIFontSizeScheme> lerp(
      ThemeExtension<UIFontSizeScheme>? other, double t) {
    return this;
  }
}
