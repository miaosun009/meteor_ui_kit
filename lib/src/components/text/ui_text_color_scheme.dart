import 'package:flutter/material.dart';

@immutable
class UITextColorScheme {
  final Color primary;
  final Color success;
  final Color warning;
  final Color error;
  final Color link;
  final Color headline;
  final Color title;

  List<Color> get values => [
        primary,
        success,
        warning,
        error,
        link,
        headline,
        title,
      ];

  const UITextColorScheme({
    required this.primary,
    required this.success,
    required this.warning,
    required this.error,
    required this.link,
    required this.headline,
    required this.title,
  });

  UITextColorScheme copyWith({
    Color? primary,
    Color? success,
    Color? warning,
    Color? error,
    Color? link,
    Color? headline,
    Color? title,
  }) {
    return UITextColorScheme(
      primary: primary ?? this.primary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      link: link ?? this.link,
      headline: headline ?? this.headline,
      title: title ?? this.title,
    );
  }
}

enum UIFontColor {
  primary,
  success,
  warning,
  error,
  link,
  headline,
  title,
}
