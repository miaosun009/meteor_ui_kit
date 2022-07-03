import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/src/components/typography/ut_font_size_scheme.dart';
import 'package:meteor_ui_kit/src/components/typography/ut_font_weight_scheme.dart';
import 'package:meteor_ui_kit/src/foundation/color_scheme.dart';

final Iterable<ThemeExtension<dynamic>> componentThemeTogetherDark = [
  UIColorScheme.dark(),
  UIFontSizeScheme.normal(),
  UIFontWeightScheme.normal(),
];

final Iterable<ThemeExtension<dynamic>> componentThemeTogetherLight = [
  UIColorScheme.light(),
  UIFontSizeScheme.normal(),
  UIFontWeightScheme.normal(),
];
