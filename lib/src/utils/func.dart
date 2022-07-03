import 'dart:async';

/// 防抖函数
Function()? debounceFunc(
  FutureOr Function() func, {
  Duration duration = const Duration(milliseconds: 200),
}) {
  Timer? timer;
  bool lock = false;
  return () async {
    if (lock) return;
    timer?.cancel();
    timer = Timer(
      duration,
      () async {
        try {
          lock = true;
          timer?.cancel();
          await func.call();
        } catch (_) {
        } finally {
          lock = false;
        }
      },
    );
  };
}
