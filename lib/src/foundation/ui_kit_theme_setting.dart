import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class UIKitThemeSetting with Diagnosticable {
  final ThemeMode mode;
  final String fontFamily;

  const UIKitThemeSetting({this.mode = ThemeMode.system, this.fontFamily = ''});

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is UIKitThemeSetting && other.mode == mode && other.fontFamily == fontFamily;
  }

  UIKitThemeSetting copyWith({
    ThemeMode? mode,
    String? fontFamily,
  }) {
    return UIKitThemeSetting(
      mode: mode ?? this.mode,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

  @override
  int get hashCode => hashValues(mode, fontFamily);
}