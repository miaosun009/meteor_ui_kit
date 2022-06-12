import 'package:example/pages/color_scheme_page.dart';
import 'package:example/pages/index_page.dart';
import 'package:example/pages/theme_setting.dart';
import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/foundation.dart';

void main() {
  UIKit().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// TODO 更换主题重复渲染问题
    return UIKitListenableBuilder(
      builder: (context, themeSetting) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(fontFamily: themeSetting.fontFamily),
          darkTheme: ThemeData(fontFamily: themeSetting.fontFamily, brightness: Brightness.dark),
          // theme: UIKit().themeBuilder.light(fontFamily: themeSetting.fontFamily),
          // darkTheme: UIKit().themeBuilder.dark(fontFamily: themeSetting.fontFamily),
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
        '/themeSetting': (_) => ThemeSettingPage(),
      };
}
