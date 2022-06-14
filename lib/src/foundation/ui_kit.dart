import 'package:flutter/foundation.dart';
import 'package:meteor_ui_kit/src/foundation/screen_adapter/src/screen_adapter_binding.dart';
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

  UIKitDesignSize? _designSize;

  UIKitDesignSize? get designSize => _designSize;

  bool? _initialized;

  DebugPrintCallback? debugPrintCallback;

  bool get enableLog => _enableLog ?? true;
  bool? _enableLog;

  UIKit._() {
    _themeSetting = const UIKitThemeSetting();
  }

  factory UIKit() => _instance ??= UIKit._();
  final UIKitThemeBuilder themeBuilder = const UIKitThemeBuilder();

  /// UIKit 初始化
  init({UIKitDesignSize? designSize, bool enableLog = true}) {
    if (_initialized != true) {
      _enableLog = enableLog;
      _designSize = designSize;
      if (_designSize != null) {
        UIKitWidgetsFlutterBinding.ensureInitialized();
      }
      _initialized = true;
    }
  }

  void print(String? message, {int? wrapWidth}) {
    if (_enableLog == false) return;
    if (debugPrintCallback == null) {
      debugPrint(message, wrapWidth: wrapWidth);
    } else {
      debugPrintCallback?.call(message, wrapWidth: wrapWidth);
    }
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

/// 设计稿尺寸
class UIKitDesignSize {
  final double width;
  final double length;

  const UIKitDesignSize(this.width, this.length);

  double get aspectRatio {
    if (length != 0.0) return width / length;
    if (width > 0.0) return double.infinity;
    if (width < 0.0) return double.negativeInfinity;
    return 0.0;
  }

  @override
  String toString() {
    return 'UIKitDesignSize{width: $width, length: $length}';
  }
}
