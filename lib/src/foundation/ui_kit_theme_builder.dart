import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/src/foundation/color_scheme.dart';

import '../core/component_theme_together.dart';

class UIKitThemeBuilder {
  const UIKitThemeBuilder();

  ThemeData dark({
    Iterable<ThemeExtension<dynamic>> extensions = const [],
    String? fontFamily,
  }) {
    final themeData = ThemeData(fontFamily: fontFamily, brightness: Brightness.dark, extensions: [...componentThemeTogetherDark, ...extensions]);
    return _builder(themeData: themeData);
  }

  ThemeData light({
    Iterable<ThemeExtension<dynamic>> extensions = const [],
    String? fontFamily,
  }) {
    final themeData = ThemeData(fontFamily: fontFamily, brightness: Brightness.light, extensions: [...componentThemeTogetherLight, ...extensions]);
    return _builder(themeData: themeData);
  }

  ThemeData _builder({
    required ThemeData themeData,
  }) {
    final colors = themeData.extension<UIColorScheme>()!;
    final primaryIsDark = ThemeData.estimateBrightnessForColor(colors.primary) == Brightness.dark;
    themeData = themeData.copyWith(
      colorScheme: ColorScheme(
        primary: colors.primary,
        secondary: colors.secondary,
        surface: colors.primary,
        background: colors.background,
        error: Colors.red,
        onPrimary: primaryIsDark ? Colors.white : Colors.black,
        onSecondary: primaryIsDark ? Colors.white : Colors.black,
        onSurface: primaryIsDark ? Colors.white : Colors.black,
        onBackground: colors.background,
        onError: Colors.white,
        brightness: themeData.brightness,
      ),
      scaffoldBackgroundColor: colors.background,
      cardTheme: themeData.cardTheme.copyWith(
        color: colors.card,
      ),
    );
    return themeData;
  }
}
