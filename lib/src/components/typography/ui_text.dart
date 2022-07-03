import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/foundation.dart';
import 'package:meteor_ui_kit/src/components/typography/ut_font_size_scheme.dart';
import 'package:meteor_ui_kit/src/components/typography/ut_font_weight_scheme.dart';
import 'package:meteor_ui_kit/src/foundation/color_scheme.dart';

class UIText extends StatelessWidget {
  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextStyle? style;

  const UIText(
    this.data, {
    this.color,
    this.fontSize,
    this.fontWeight,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
    if (style != null) {
      textStyle = textStyle.merge(style);
    }

    return Text(
      data,
      style: DefaultTextStyle.of(context).style.merge(textStyle),
    );
  }
}

class UITypography extends StatelessWidget {
  final String data;
  final UIFontColor? fontColor;
  final UIFontSize? fontSize;
  final TextStyle? textStyle;
  final UIFontWeight? fontWeight;

  const UITypography(
    this.data, {
    this.fontColor,
    this.fontSize,
    this.textStyle,
    this.fontWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = getFontColor(context, fontColor);
    final size = getFontSize(context, fontSize);
    final weight = getFontWeight(context, fontWeight);
    TextStyle? textStyle;
    if (this.textStyle != null) {
      textStyle = TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ).merge(this.textStyle);
    }
    return UIText(
      data,
      color: color,
      fontSize: size,
      fontWeight: weight,
      style: textStyle,
    );
  }

  static Color? getFontColor(BuildContext context, UIFontColor? fontColor) {
    final colorSchemers = UIKitTheme.extension<UIColorScheme>(context)!;
    final map = {
      UIFontColor.primary: colorSchemers.primary,
      UIFontColor.warning: colorSchemers.warning,
      UIFontColor.error: colorSchemers.error,
      UIFontColor.link: colorSchemers.link,
    };

    if (map.containsKey(fontColor)) return map[fontColor];
    return null;
  }

  static double? getFontSize(BuildContext context, UIFontSize? fontSize) {
    final fontSizeScheme = UIKitTheme.extension<UIFontSizeScheme>(context)!;
    final map = {
      UIFontSize.h1: fontSizeScheme.h1,
      UIFontSize.h2: fontSizeScheme.h2,
      UIFontSize.h3: fontSizeScheme.h3,
      UIFontSize.h4: fontSizeScheme.h4,
    };
    if (map.containsKey(fontSize)) return map[fontSize];
    return null;
  }

  static FontWeight? getFontWeight(
    BuildContext context,
    UIFontWeight? fontWeight,
  ) {
    final fontWeightScheme = UIKitTheme.extension<UIFontWeightScheme>(context)!;
    return fontWeightScheme.value(fontWeight);
  }
}

class UIH1 extends UITypography {
  const UIH1(
    super.data, {
    super.fontColor,
    super.textStyle,
    super.fontWeight = UIFontWeight.bold,
    super.key,
  }) : super(fontSize: UIFontSize.h1);
}

class UIH2 extends UITypography {
  const UIH2(
    super.data, {
    super.fontColor,
    super.textStyle,
    super.fontWeight = UIFontWeight.medium,
    super.key,
  }) : super(fontSize: UIFontSize.h2);
}

enum UIFontSize {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  body,
  span,
}

enum UIFontColor {
  primary,
  success,
  warning,
  error,
  link,
}

enum UIFontWeight {
  bold("bold"),
  medium("medium"),
  regular("regular");

  final String value;

  const UIFontWeight(this.value);
}
