import 'package:flutter/material.dart';

import '../components/text/ui_text_color_scheme.dart';

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
  final UITextColorScheme textColorScheme;

  const UIColorScheme({
    required this.background,
    required this.primary,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.error,
    required this.link,
    required this.card,
    required this.textColorScheme,
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
      textColorScheme: UITextColorScheme(
        primary: Color(0xFF1A1A1C),
        success: Colors.green,
        warning: Colors.orange,
        error: Colors.red,
        link: Colors.green,
        headline: Colors.grey,
        title: Colors.grey,
      ),
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
      textColorScheme: UITextColorScheme(
        primary: Colors.blueAccent,
        success: Colors.green,
        warning: Colors.orange,
        error: Colors.red,
        link: Colors.green,
        headline: Colors.grey,
        title: Colors.grey,
      ),
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
    UITextColorScheme? textColorScheme,
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
      textColorScheme: textColorScheme ?? this.textColorScheme,
    );
  }

  @override
  ThemeExtension<UIColorScheme> lerp(
      ThemeExtension<UIColorScheme>? other, double t) {
    return this;
  }
}
