import 'package:flutter/material.dart';

@immutable
class UIColorScheme extends ThemeExtension<UIColorScheme> {
  final Color primary;
  final Color success;
  final Color warning;
  final Color error;
  final Color link;
  final Color background;
  final Color card;
  final Color headlineText;
  final Color titleText;
  final Color regularText;
  final Color secondaryText;
  final Color tertiaryText;
  final Color inverseText;

  const UIColorScheme({
    required this.primary,
    required this.success,
    required this.warning,
    required this.error,
    required this.link,
    required this.background,
    required this.card,
    required this.headlineText,
    required this.titleText,
    required this.regularText,
    required this.secondaryText,
    required this.tertiaryText,
    required this.inverseText,
  });

  factory UIColorScheme.dark() {
    return const UIColorScheme(
      primary: Color(0xFF1A1A1C),
      success: Colors.green,
      warning: Colors.orange,
      error: Colors.red,
      link: Colors.green,
      background: Colors.black,
      card: Colors.grey,
      headlineText: Colors.black,
      titleText: Colors.black,
      regularText: Colors.black,
      secondaryText: Colors.black,
      tertiaryText: Colors.black,
      inverseText: Colors.white,
    );
  }

  factory UIColorScheme.light() {
    return const UIColorScheme(
      primary: Colors.blueAccent,
      success: Colors.green,
      warning: Colors.orange,
      error: Colors.red,
      link: Colors.blue,
      background: Colors.white,
      card: Colors.grey,
      headlineText: Color(0xff222222),
      titleText: Color(0xff222222),
      regularText: Color(0xff666666),
      secondaryText: Color(0xff999999),
      tertiaryText: Color(0xffcccccc),
      inverseText: Colors.white,
    );
  }

  @override
  ThemeExtension<UIColorScheme> copyWith({
    Color? primary,
    Color? secondary,
    Color? success,
    Color? warning,
    Color? error,
    Color? link,
    Color? background,
    Color? card,
    Color? headlineText,
    Color? titleText,
    Color? regularText,
    Color? secondaryText,
    Color? tertiaryText,
    Color? inverseText,
  }) {
    return UIColorScheme(
      primary: primary ?? this.primary,
      background: background ?? this.background,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      link: link ?? this.link,
      card: card ?? this.card,
      headlineText: headlineText ?? this.headlineText,
      titleText: titleText ?? this.titleText,
      regularText: regularText ?? this.regularText,
      secondaryText: secondaryText ?? this.secondaryText,
      tertiaryText: tertiaryText ?? this.tertiaryText,
      inverseText: inverseText ?? this.inverseText,
    );
  }

  @override
  ThemeExtension<UIColorScheme> lerp(
    ThemeExtension<UIColorScheme>? other,
    double t,
  ) {
    return this;
  }
}
