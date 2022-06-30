import 'package:example/pages/color_scheme_page.dart';
import 'package:example/pages/index_page.dart';
import 'package:example/pages/theme_setting.dart';
import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/foundation.dart';

void main() {
  UIKit().init(
    designSize: const UIKitDesignSize(360, 677),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UIKitListenableBuilder(
      builder: (context, themeSetting) {
        return UIKitApp(
          title: 'Flutter Demo',
          theme:
              UIKit().themeBuilder.light(fontFamily: themeSetting.fontFamily),
          darkTheme:
              UIKit().themeBuilder.dark(fontFamily: themeSetting.fontFamily),
          themeMode: themeSetting.mode,
          routes: routes,
          initialRoute: '/',
        );
      },
    );
  }

  get routes => {
        '/': (_) => const IndexPage(),
        '/colorScheme': (_) => const ColorSchemePage(),
        '/themeSetting': (_) => const ThemeSettingPage(),
      };
}
