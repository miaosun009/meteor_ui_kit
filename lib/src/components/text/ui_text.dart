import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/foundation.dart';
import 'package:meteor_ui_kit/src/components/text/ui_text_color_scheme.dart';
import 'package:meteor_ui_kit/src/components/text/ut_font_size_scheme.dart';
import 'package:meteor_ui_kit/src/components/text/ut_font_weight_scheme.dart';
import 'package:meteor_ui_kit/src/foundation/color_scheme.dart';

class UITypography extends StatelessWidget {
  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextStyle? style;

  const UITypography(
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

class UIText extends StatelessWidget {
  final String data;
  final UIFontColor? fontColor;
  final UIFontSize? fontSize;
  final UIFontWeight? fontWeight;
  final TextStyle? textStyle;

  const UIText(
    this.data, {
    this.fontColor,
    this.fontSize,
    this.fontWeight,
    this.textStyle,
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
    return UITypography(
      data,
      color: color,
      fontSize: size,
      fontWeight: weight,
      style: textStyle,
    );
  }

  static Color? getFontColor(BuildContext context, UIFontColor? fontColor) {
    final colorSchemers = UIKitTheme.extension<UIColorScheme>(context)!;
    if (fontColor != null) {
      colorSchemers.textColorScheme.values[fontColor.index];
    }
    return null;
  }

  static double? getFontSize(BuildContext context, UIFontSize? fontSize) {
    final scheme = UIKitTheme.extension<UIFontSizeScheme>(context)!;
    if (fontSize != null) {
      return scheme.values[fontSize.index];
    } else {
      return null;
    }
  }

  static FontWeight? getFontWeight(
    BuildContext context,
    UIFontWeight? fontWeight,
  ) {
    final scheme = UIKitTheme.extension<UIFontWeightScheme>(context)!;
    if (fontWeight != null) {
      return scheme.values[fontWeight.index];
    } else {
      return null;
    }
  }
}

class UIH1 extends UIText {
  const UIH1(
    super.data, {
    super.fontColor,
    super.textStyle,
    super.fontWeight = UIFontWeight.bold,
    super.key,
  }) : super(fontSize: UIFontSize.headline1);
}

class UIH2 extends UIText {
  const UIH2(
    super.data, {
    super.fontColor,
    super.textStyle,
    super.fontWeight = UIFontWeight.medium,
    super.key,
  }) : super(fontSize: UIFontSize.headline2);
}
