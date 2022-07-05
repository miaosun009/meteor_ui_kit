import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/src/components/text/ut_font_size_scheme.dart';
import 'package:meteor_ui_kit/src/components/text/ut_font_weight_scheme.dart';
import 'package:meteor_ui_kit/src/foundation/color_scheme.dart';

List<ThemeExtension> get componentThemeTogetherDark => [
      UIColorScheme.dark(),
      UIFontSizeScheme.fromDefault(),
      UIFontWeightScheme.fromDefault(),
    ];

List<ThemeExtension> get componentThemeTogetherLight => [
      UIColorScheme.light(),
      UIFontSizeScheme.fromDefault(),
      UIFontWeightScheme.fromDefault(),
    ];
