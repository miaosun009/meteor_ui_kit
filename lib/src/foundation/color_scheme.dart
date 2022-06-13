import 'package:flutter/material.dart';

@immutable
class UIColorScheme extends ThemeExtension<UIColorScheme> {
  final Color background;
  final Color primary;
  final Color secondary;
  final Color success;
  final Color warning;
  final Color error;
  final Color link;
  final Color card;

  const UIColorScheme({
    required this.background,
    required this.primary,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.error,
    required this.link,
    required this.card,
  });

  factory UIColorScheme.dark() {
    return const UIColorScheme(
      background: Colors.black,
      primary: Color(0xFF1A1A1C),
      secondary: Color(0xFF36363A),
      success: Colors.green,
      warning: Colors.orange,
      error: Colors.red,
      link: Colors.green,
      card: Colors.grey,
    );
  }

  factory UIColorScheme.light() {
    return const UIColorScheme(
      background: Colors.white,
      primary: Colors.blueAccent,
      secondary: Colors.blueAccent,
      success: Colors.green,
      warning: Colors.orange,
      error: Colors.red,
      link: Colors.blue,
      card: Colors.grey,
    );
  }

  @override
  ThemeExtension<UIColorScheme> copyWith({
    Color? background,
    Color? primary,
    Color? secondary,
    Color? success,
    Color? warning,
    Color? error,
    Color? link,
    Color? card,
  }) {
    return UIColorScheme(
      primary: primary ?? this.primary,
      background: background ?? this.background,
      secondary: secondary ?? this.secondary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      link: link ?? this.link,
      card: card ?? this.card,
    );
  }

  @override
  ThemeExtension<UIColorScheme> lerp(ThemeExtension<UIColorScheme>? other, double t) {
    return this;
  }
}
