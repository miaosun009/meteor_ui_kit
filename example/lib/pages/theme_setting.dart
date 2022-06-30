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
    return UIKitListenableBuilder(builder: (_, __) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Theme Setting"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Text("Theme mode"),
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
                  child: const Text("Dark"),
                ),
                MaterialButton(
                  color: UIKit().themeSetting.mode == ThemeMode.light
                      ? colors?.primary
                      : null,
                  onPressed: () {
                    UIKit().themeSetting =
                        UIKit().themeSetting.copyWith(mode: ThemeMode.light);
                  },
                  child: const Text("Light"),
                ),
                MaterialButton(
                  color: UIKit().themeSetting.mode == ThemeMode.system
                      ? colors?.primary
                      : null,
                  onPressed: () {
                    UIKit().themeSetting =
                        UIKit().themeSetting.copyWith(mode: ThemeMode.system);
                  },
                  child: const Text("System"),
                )
              ],
            ),
            const UISizedBox(height: 42),
            const Text("Font family"),
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
                  child: const Text("Default"),
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
                  child: const Text("JetBrainsMono"),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
