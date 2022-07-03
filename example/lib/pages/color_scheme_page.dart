import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/components.dart';

class ColorSchemePage extends StatefulWidget {
  const ColorSchemePage({Key? key}) : super(key: key);

  @override
  State<ColorSchemePage> createState() => _ColorSchemePageState();
}

class _ColorSchemePageState extends State<ColorSchemePage> {
  @override
  Widget build(BuildContext context) {
    final uiColorScheme = Theme.of(context).extension<UIColorScheme>()!;
    final titles = colorsScheme.keys.toList();
    final colors = colorsScheme.values.toList();
    final backgroundIsDark =
        ThemeData.estimateBrightnessForColor(uiColorScheme.background) ==
            Brightness.dark;
    final onBackground = backgroundIsDark ? Colors.white : Colors.black;
    return Scaffold(
      appBar: AppBar(
        title: const Text("UIColorScheme"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        children: colors.asMap().keys.map((index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: onBackground, width: 1),
            ),
            child: DefaultTextStyle(
              style: TextStyle(
                  color: ThemeData.estimateBrightnessForColor(colors[index]) ==
                          Brightness.dark
                      ? Colors.white
                      : Colors.black),
              child: Text(titles[index]),
            ),
          );
        }).toList(),
      ),
    );
  }

  Map<String, Color> get colorsScheme {
    final colors = Theme.of(context).extension<UIColorScheme>()!;
    return {
      "Background": colors.background,
      "Primary": colors.primary,
      "Secondary": colors.secondary,
      "Success": colors.success,
      "Warning": colors.warning,
      "Error": colors.error,
      "Link": colors.link,
      "Card": colors.card,
    };
  }
}
