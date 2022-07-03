import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/components.dart';
import 'package:meteor_ui_kit/src/utils/func.dart';

class UIDebounceTap extends StatelessWidget {
  final Widget child;
  final FutureOr Function()? onTap;
  final Duration duration;

  const UIDebounceTap({
    required this.child,
    this.onTap,
    this.duration = const Duration(milliseconds: 200),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UIGestureDetector(
      onTap: debounceFunc(onTap ?? () => {}, duration: duration),
      child: child,
    );
  }
}
