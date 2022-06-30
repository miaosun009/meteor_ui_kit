import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/components.dart';

/// 防抖Tap
class UIDebounceTap extends StatefulWidget {
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
  State<UIDebounceTap> createState() => _UIDebounceTapState();
}

class _UIDebounceTapState extends State<UIDebounceTap> {
  Timer? timer;
  bool lock = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return UIGestureDetector(
      onTap: () async {
        if (lock) return;
        timer?.cancel();
        timer = Timer(widget.duration, () async {
          try {
            lock = true;
            await widget.onTap?.call();
          } catch (_) {
          } finally {
            timer?.cancel();
            lock = false;
          }
        });
      },
      child: widget.child,
    );
  }
}
