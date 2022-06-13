import 'package:flutter/foundation.dart';
import 'package:meteor_ui_kit/src/foundation/ui_kit_theme_builder.dart';
import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/src/foundation/ui_kit_theme_setting.dart';

class UIKit extends ChangeNotifier {
  static UIKit? _instance;
  UIKitThemeSetting? _themeSetting;

  UIKitThemeSetting get themeSetting => _themeSetting!;

  set themeSetting(UIKitThemeSetting setting) {
    _themeSetting = setting;
    notifyListeners();
  }

  UIKit._() {
    _themeSetting = const UIKitThemeSetting();
  }

  factory UIKit() => _instance ??= UIKit._();
  final UIKitThemeBuilder themeBuilder = const UIKitThemeBuilder();

  /// UIKit 初始化
  init() {
    // ThemeData(extensions: )
  }
}

class UIKitListenableBuilder extends StatefulWidget {
  final Function(BuildContext, UIKitThemeSetting) builder;

  const UIKitListenableBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  State<UIKitListenableBuilder> createState() => _UIKitListenableBuilderState();
}

class _UIKitListenableBuilderState extends State<UIKitListenableBuilder> {
  @override
  initState() {
    super.initState();
    UIKitThemeSetting? setting;
    UIKit().addListener(() {
      if (UIKit().themeSetting != setting) {
        setting = UIKit().themeSetting;
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, UIKit().themeSetting);
}

abstract class UIKitTheme {
  static T? extension<T>(BuildContext context) {
    try {
      return Theme.of(context).extension<T>();
    } catch (_) {
      return null;
    }
  }
}
