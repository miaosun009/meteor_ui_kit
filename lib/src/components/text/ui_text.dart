import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/foundation.dart';
import 'package:meteor_ui_kit/src/components/text/ut_font_size_scheme.dart';
import 'package:meteor_ui_kit/src/components/text/ut_font_weight_scheme.dart';
import 'package:meteor_ui_kit/src/foundation/color_scheme.dart';

enum UIFontColor {
  primary,
  success,
  warning,
  error,
  link,
  headline,
  title,
  regular,
  secondary,
  tertiary,
  inverse,
}

enum UIFontWeight {
  bold,
  medium,
  regular,
  light,
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

class UITypography extends StatelessWidget {
  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextStyle? style;
  final double? minFontSize;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDirection? textDecoration;
  final Locale? locale;
  final TextOverflow? overflow;
  final bool? softWrap;
  final String? semanticsLabel;
  final double? textScaleFactor;
  final StrutStyle? strutStyle;

  const UITypography(
    this.data, {
    this.color,
    this.fontSize,
    this.fontWeight,
    this.style,
    this.minFontSize,
    this.maxLines,
    this.textAlign,
    this.textDecoration,
    this.locale,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
    this.textScaleFactor,
    this.strutStyle,
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
    final merged = DefaultTextStyle.of(context).style.merge(textStyle);
    return AutoSizeText(
      data,
      minFontSize: minFontSize ?? merged.fontSize ?? 12,
      style: merged,
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDecoration,
      locale: locale,
      overflow: overflow,
      softWrap: softWrap,
      strutStyle: strutStyle,
      semanticsLabel: semanticsLabel,
      textScaleFactor: textScaleFactor,
    );
  }
}

class UITextBasic extends StatelessWidget {
  final String data;
  final UIFontColor? fontColor;
  final UIFontSize? fontSize;
  final UIFontWeight? fontWeight;
  final TextStyle? textStyle;
  final double? minFontSize;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDirection? textDecoration;
  final Locale? locale;
  final TextOverflow? overflow;
  final bool? softWrap;
  final String? semanticsLabel;
  final double? textScaleFactor;
  final StrutStyle? strutStyle;

  const UITextBasic(
    this.data, {
    this.fontColor,
    this.fontSize,
    this.fontWeight,
    this.textStyle,
    this.minFontSize,
    this.maxLines,
    this.textAlign,
    this.textDecoration,
    this.locale,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
    this.textScaleFactor,
    this.strutStyle,
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
      minFontSize: minFontSize,
      maxLines: maxLines,
      textAlign: textAlign,
      textDecoration: textDecoration,
      locale: locale,
      overflow: overflow,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
      textScaleFactor: textScaleFactor,
      strutStyle: strutStyle,
    );
  }

  static Color? getFontColor(BuildContext context, UIFontColor? fontColor) {
    final colorScheme = UIKitTheme.extension<UIColorScheme>(context);
    if (fontColor != null && colorScheme != null) {
      final colors = {
        UIFontColor.primary: colorScheme.primary,
        UIFontColor.success: colorScheme.success,
        UIFontColor.warning: colorScheme.warning,
        UIFontColor.error: colorScheme.error,
        UIFontColor.link: colorScheme.link,
        UIFontColor.headline: colorScheme.headlineText,
        UIFontColor.title: colorScheme.titleText,
        UIFontColor.regular: colorScheme.regularText,
        UIFontColor.secondary: colorScheme.secondaryText,
        UIFontColor.tertiary: colorScheme.tertiaryText,
        UIFontColor.inverse: colorScheme.inverseText,
      };
      return colors[fontColor];
    } else {
      return null;
    }
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

class UIText extends UITextBasic {
  const UIText(
    super.data, {
    super.fontColor,
    super.fontWeight,
    super.textStyle,
    super.minFontSize,
    super.maxLines,
    super.textAlign,
    super.textDecoration,
    super.locale,
    super.overflow,
    super.softWrap,
    super.semanticsLabel,
    super.textScaleFactor,
    super.strutStyle,
    super.key,
  });

  const UIText.h1(
    super.data, {
    super.fontColor,
    super.fontWeight = UIFontWeight.bold,
    super.textStyle,
    super.minFontSize,
    super.maxLines,
    super.textAlign,
    super.textDecoration,
    super.locale,
    super.overflow,
    super.softWrap,
    super.semanticsLabel,
    super.textScaleFactor,
    super.strutStyle,
    super.key,
  }) : super(fontSize: UIFontSize.headline1);

  const UIText.h2(
    super.data, {
    super.fontColor,
    super.fontWeight = UIFontWeight.bold,
    super.textStyle,
    super.minFontSize,
    super.maxLines,
    super.textAlign,
    super.textDecoration,
    super.locale,
    super.overflow,
    super.softWrap,
    super.semanticsLabel,
    super.textScaleFactor,
    super.strutStyle,
    super.key,
  }) : super(fontSize: UIFontSize.headline2);

  const UIText.h3(
    super.data, {
    super.fontColor,
    super.fontWeight = UIFontWeight.bold,
    super.textStyle,
    super.minFontSize,
    super.maxLines,
    super.textAlign,
    super.textDecoration,
    super.locale,
    super.overflow,
    super.softWrap,
    super.semanticsLabel,
    super.textScaleFactor,
    super.strutStyle,
    super.key,
  }) : super(fontSize: UIFontSize.headline3);

  const UIText.h4(
    super.data, {
    super.fontColor,
    super.fontWeight = UIFontWeight.bold,
    super.textStyle,
    super.minFontSize,
    super.maxLines,
    super.textAlign,
    super.textDecoration,
    super.locale,
    super.overflow,
    super.softWrap,
    super.semanticsLabel,
    super.textScaleFactor,
    super.strutStyle,
    super.key,
  }) : super(fontSize: UIFontSize.headline4);

  const UIText.h5(
    super.data, {
    super.fontColor,
    super.fontWeight = UIFontWeight.bold,
    super.textStyle,
    super.minFontSize,
    super.maxLines,
    super.textAlign,
    super.textDecoration,
    super.locale,
    super.overflow,
    super.softWrap,
    super.semanticsLabel,
    super.textScaleFactor,
    super.strutStyle,
    super.key,
  }) : super(fontSize: UIFontSize.headline5);

  const UIText.h6(
    super.data, {
    super.fontColor,
    super.fontWeight = UIFontWeight.bold,
    super.textStyle,
    super.minFontSize,
    super.maxLines,
    super.textAlign,
    super.textDecoration,
    super.locale,
    super.overflow,
    super.softWrap,
    super.semanticsLabel,
    super.textScaleFactor,
    super.strutStyle,
    super.key,
  }) : super(fontSize: UIFontSize.headline6);

  const UIText.title(
    super.data, {
    super.fontColor,
    super.fontWeight = UIFontWeight.medium,
    super.textStyle,
    super.minFontSize,
    super.maxLines,
    super.textAlign,
    super.textDecoration,
    super.locale,
    super.overflow,
    super.softWrap,
    super.semanticsLabel,
    super.textScaleFactor,
    super.strutStyle,
    super.key,
  }) : super(fontSize: UIFontSize.title);

  const UIText.subtitle(
    super.data, {
    super.fontColor,
    super.fontWeight = UIFontWeight.medium,
    super.textStyle,
    super.minFontSize,
    super.maxLines,
    super.textAlign,
    super.textDecoration,
    super.locale,
    super.overflow,
    super.softWrap,
    super.semanticsLabel,
    super.textScaleFactor,
    super.strutStyle,
    super.key,
  }) : super(fontSize: UIFontSize.subtitle);

  const UIText.body(
    super.data, {
    super.fontColor,
    super.fontWeight,
    super.textStyle,
    super.minFontSize,
    super.maxLines,
    super.textAlign,
    super.textDecoration,
    super.locale,
    super.overflow,
    super.softWrap,
    super.semanticsLabel,
    super.textScaleFactor,
    super.strutStyle,
    super.key,
  }) : super(fontSize: UIFontSize.body);

  const UIText.label(
    super.data, {
    super.fontColor,
    super.fontWeight,
    super.textStyle,
    super.minFontSize,
    super.maxLines,
    super.textAlign,
    super.textDecoration,
    super.locale,
    super.overflow,
    super.softWrap,
    super.semanticsLabel,
    super.textScaleFactor,
    super.strutStyle,
    super.key,
  }) : super(fontSize: UIFontSize.label);

  const UIText.micro(
    super.data, {
    super.fontColor,
    super.fontWeight,
    super.textStyle,
    super.minFontSize,
    super.maxLines,
    super.textAlign,
    super.textDecoration,
    super.locale,
    super.overflow,
    super.softWrap,
    super.semanticsLabel,
    super.textScaleFactor,
    super.strutStyle,
    super.key,
  }) : super(fontSize: UIFontSize.micro);
}
