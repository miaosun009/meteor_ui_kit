import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/components.dart';
import 'package:meteor_ui_kit/foundation.dart';

class ThemeSettingPage extends StatefulWidget {
  ThemeSettingPage({Key? key}) : super(key: key);

  @override
  State<ThemeSettingPage> createState() => _ThemeSettingPageState();
}

class _ThemeSettingPageState extends State<ThemeSettingPage> {
  @override
  Widget build(BuildContext context) {
    print("主题模式:${UIKit().themeSetting.mode}");
    //final colors = Theme.of(context).extension<UIColorScheme>();
    final colors = UIColorScheme.dark();
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Setting"),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              MaterialButton(
                color: UIKit().themeSetting.mode == ThemeMode.dark ? colors?.primary : null,
                onPressed: () {
                  UIKit().themeSetting = UIKit().themeSetting.copyWith(mode: ThemeMode.dark);
                },
                child: Text("深色模式"),
              ),
              MaterialButton(
                color: UIKit().themeSetting.mode == ThemeMode.light ? colors?.primary : null,
                onPressed: () {
                  UIKit().themeSetting = UIKit().themeSetting.copyWith(mode: ThemeMode.light);
                },
                child: Text("浅色模式"),
              ),
              MaterialButton(
                color: UIKit().themeSetting.mode == ThemeMode.system ? colors?.primary : null,
                onPressed: () {
                  UIKit().themeSetting = UIKit().themeSetting.copyWith(mode: ThemeMode.system);
                },
                child: Text("跟随系统"),
              )
            ],
          ),
          Row(
            children: [
              MaterialButton(
                color: UIKit().themeSetting.fontFamily.isEmpty ? colors?.primary : null,
                onPressed: () {
                  UIKit().themeSetting = UIKit().themeSetting.copyWith(fontFamily: '');
                },
                child: Text("默认字体"),
              ),
              MaterialButton(
                color: UIKit().themeSetting.fontFamily.contains('JetBrainsMono') ? colors?.primary : null,
                onPressed: () {
                  UIKit().themeSetting = UIKit().themeSetting.copyWith(fontFamily: 'JetBrainsMono');
                },
                child: Text("JetBrainsMono"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
