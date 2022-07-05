import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/components.dart';
import 'package:meteor_ui_kit/foundation.dart';

class ThemeSettingPage extends StatefulWidget {
  const ThemeSettingPage({Key? key}) : super(key: key);

  @override
  State<ThemeSettingPage> createState() => _ThemeSettingPageState();
}

class _ThemeSettingPageState extends State<ThemeSettingPage> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<UIColorScheme>();
    final a=Theme.of(context).colorScheme;

    return UIKitListenableBuilder(builder: (_, __) {
      return Scaffold(
        appBar: AppBar(
          title: const UIText("Theme Setting"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const UIText.title("Theme mode"),
            const UISizedBox(height: 12),
            UIRow(
              children: [
                MaterialButton(
                  color: UIKit().themeSetting.mode == ThemeMode.dark
                      ? colors?.primary
                      : null,
                  onPressed: () {
                    UIKit().themeSetting =
                        UIKit().themeSetting.copyWith(mode: ThemeMode.dark);
                  },
                  child: const UIText("Dark"),
                ),
                MaterialButton(
                  color: UIKit().themeSetting.mode == ThemeMode.light
                      ? colors?.primary
                      : null,
                  onPressed: () {
                    UIKit().themeSetting =
                        UIKit().themeSetting.copyWith(mode: ThemeMode.light);
                  },
                  child: const UIText("Light"),
                ),
                MaterialButton(
                  color: UIKit().themeSetting.mode == ThemeMode.system
                      ? colors?.primary
                      : null,
                  onPressed: () {
                    UIKit().themeSetting =
                        UIKit().themeSetting.copyWith(mode: ThemeMode.system);
                  },
                  child: const UIText("System"),
                )
              ],
            ),
            const UISizedBox(height: 42),
            const UIText.title("Font family"),
            const UISizedBox(height: 12),
            UIRow(
              children: [
                MaterialButton(
                  color: UIKit().themeSetting.fontFamily.isEmpty
                      ? colors?.primary
                      : null,
                  onPressed: () {
                    UIKit().themeSetting =
                        UIKit().themeSetting.copyWith(fontFamily: '');
                  },
                  child: const UIText("Default"),
                ),
                MaterialButton(
                  color:
                      UIKit().themeSetting.fontFamily.contains('JetBrainsMono')
                          ? colors?.primary
                          : null,
                  onPressed: () {
                    UIKit().themeSetting = UIKit()
                        .themeSetting
                        .copyWith(fontFamily: 'JetBrainsMono');
                  },
                  child: const UIText("JetBrainsMono"),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
