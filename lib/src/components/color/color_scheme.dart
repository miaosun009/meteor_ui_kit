import 'package:flutter/material.dart';

@immutable
class UIColorScheme extends ThemeExtension<UIColorScheme> {
  final Color background;
  final Color primary;
  final Color secondary;
  final Color card;

  const UIColorScheme({
    required this.background,
    required this.primary,
    required this.secondary,
    required this.card,
  });

  factory UIColorScheme.dark() {
    return const UIColorScheme(
      background: Colors.black,
      primary: Colors.green,
      secondary: Colors.green,
      card: Colors.grey,
    );
  }

  factory UIColorScheme.light() {
    return const UIColorScheme(
      background: Colors.white,
      primary: Colors.blue,
      secondary: Colors.blue,
      card: Colors.white,
    );
  }

  @override
  ThemeExtension<UIColorScheme> copyWith({
    Color? background,
    Color? primary,
    Color? secondary,
    Color? card,
  }) {
    return UIColorScheme(
      background: background ?? this.background,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      card: card ?? this.card,
    );
  }

  @override
  ThemeExtension<UIColorScheme> lerp(ThemeExtension<UIColorScheme>? other, double t) {
    return this;
  }
}
