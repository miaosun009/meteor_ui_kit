import 'package:flutter/widgets.dart';
import 'package:meteor_ui_kit/src/core/screen_adapter/ui_kit_screen_adapter_binding.dart';
import 'dart:ui' as ui show window;
import '../../../../foundation.dart';
import 'ui_kit_screen_info.dart';

// ignore: non_constant_identifier_names
TransitionBuilder UIKitScreenTransitionBuilder({TransitionBuilder? builder}) {
  if (WidgetsBinding.instance is UIKitScreenAdapterBinding == false)
    return builder ?? (context, child) => child ?? const SizedBox.shrink();
  final designSize = UIKit().designSize!;
  return (context, child) {
    var old = MediaQuery.of(context);
    var deviceShortWidth =
        ui.window.physicalSize.width <= ui.window.physicalSize.height
            ? ui.window.physicalSize.width
            : ui.window.physicalSize.height;
    if (deviceShortWidth == 0)
      deviceShortWidth = old.size.width < old.size.height
          ? old.size.width * old.devicePixelRatio
          : old.size.height * old.devicePixelRatio;
    double actualPixelRatio = deviceShortWidth / designSize.width;
    UIKitScreenInfo.init(
            actualPixelRatio: actualPixelRatio, designSize: designSize)
        .onScreenMetricsChange(old);
    UIKit().print("Info=${UIKitScreenInfo.instance}");
    return TransitionBuilderWidget(
      builder: builder ?? (__, child) => child!,
      didChangeMetricsCallBack: () {
        // Info.instance.onScreenMetricsChange(old);
        // if (_enableLog) print("$_TAG Info=${Info.instance}");
      },
      child: MediaQuery(
        data: old.copyWith(
          textScaleFactor: 1,
          size: (old.size / actualPixelRatio) * old.devicePixelRatio,
          devicePixelRatio: actualPixelRatio,
          padding: restore2DeviceEdgeInsets(old.padding),
          viewPadding: restore2DeviceEdgeInsets(old.viewPadding),
          viewInsets: restore2DeviceEdgeInsets(old.viewInsets),
          systemGestureInsets:
              restore2DeviceEdgeInsets(old.systemGestureInsets),
        ),
        child: child!,
      ),
    );
  };
}

class TransitionBuilderWidget extends StatefulWidget {
  final TransitionBuilder builder;
  final Widget child;
  final VoidCallback didChangeMetricsCallBack;

  /// add didChangeMetricsCallBack
  const TransitionBuilderWidget({
    Key? key,
    required this.builder,
    required this.child,
    required this.didChangeMetricsCallBack,
  }) : super(key: key);

  @override
  TransitionBuilderWidgetState createState() {
    return TransitionBuilderWidgetState();
  }
}

class TransitionBuilderWidgetState extends State<TransitionBuilderWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  ///应用尺寸改变时回调，例如旋转
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    widget.didChangeMetricsCallBack.call();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, widget.child);
}
