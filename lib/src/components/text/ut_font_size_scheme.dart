import 'package:flutter/material.dart';

@immutable
class UIFontSizeScheme extends ThemeExtension<UIFontSizeScheme> {
  final double headline1;
  final double headline2;
  final double headline3;
  final double headline4;
  final double headline5;
  final double headline6;
  final double title;
  final double subtitle;
  final double body;
  final double label;
  final double micro;

  factory UIFontSizeScheme.normal() {
    return const UIFontSizeScheme(
      headline1: 32,
      headline2: 28,
      headline3: 24,
      headline4: 22,
      headline5: 18,
      headline6: 16,
      title: 14,
      subtitle: 12,
      body: 12,
      label: 10,
      micro: 8,
    );
  }

  List<double> get values => [
        headline1,
        headline2,
        headline3,
        headline4,
        headline5,
        headline6,
        title,
        subtitle,
        body,
        label,
        micro,
      ];

  const UIFontSizeScheme({
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.headline4,
    required this.headline5,
    required this.headline6,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.label,
    required this.micro,
  });

  @override
  ThemeExtension<UIFontSizeScheme> copyWith({
    double? headline1,
    double? headline2,
    double? headline3,
    double? headline4,
    double? headline5,
    double? headline6,
    double? title,
    double? subtitle,
    double? body,
    double? label,
    double? micro,
  }) {
    return UIFontSizeScheme(
      headline1: headline1 ?? this.headline1,
      headline2: headline2 ?? this.headline2,
      headline3: headline3 ?? this.headline3,
      headline4: headline4 ?? this.headline4,
      headline5: headline5 ?? this.headline5,
      headline6: headline6 ?? this.headline6,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      body: body ?? this.body,
      label: label ?? this.label,
      micro: micro ?? this.micro,
    );
  }

  @override
  ThemeExtension<UIFontSizeScheme> lerp(
      ThemeExtension<UIFontSizeScheme>? other, double t) {
    return this;
  }
}

enum UIFontSize {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  title,
  subtitle,
  body,
  label,
  micro
}
