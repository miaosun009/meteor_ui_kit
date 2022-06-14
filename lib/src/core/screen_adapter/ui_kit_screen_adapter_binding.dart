import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:meteor_ui_kit/foundation.dart';
import 'dart:collection';
import 'dart:ui' as ui show window, PointerDataPacket;
import 'ui_kit_screen_info.dart';

///还原为设备原始实际值,使用系统像素密度
double restore2DeviceValue(double dpValue) {
  return dpValue * UIKitScreenInfo.instance.restoreRatio;
}

EdgeInsets restore2DeviceEdgeInsets(EdgeInsets dpEdgeInsets) {
  return dpEdgeInsets * UIKitScreenInfo.instance.restoreRatio;
}

Size restore2DeviceSize(Size dpSize) {
  return dpSize * UIKitScreenInfo.instance.restoreRatio;
}

class UIKitScreenAdapterBinding extends WidgetsFlutterBinding {
  static ensureInitialized() {
    UIKitScreenAdapterBinding();
  }

  @override
  ViewConfiguration createViewConfiguration() {
    return ViewConfiguration(
      size: window.physicalSize / adapterDevicePixelRatio,
      devicePixelRatio: adapterDevicePixelRatio,
    );
  }

  @override
  void initInstances() {
    super.initInstances();
    ui.window.onPointerDataPacket = _handlePointerDataPacket;
  }

  @override
  void unlocked() {
    super.unlocked();
    _flushPointerEventQueue();
  }

  final Queue<PointerEvent> _pendingPointerEvents = Queue<PointerEvent>();

  void _handlePointerDataPacket(ui.PointerDataPacket packet) {
    _pendingPointerEvents.addAll(PointerEventConverter.expand(packet.data, adapterDevicePixelRatio));
    if (!locked) _flushPointerEventQueue();
  }

  @override
  void cancelPointer(int pointer) {
    if (_pendingPointerEvents.isEmpty && !locked) scheduleMicrotask(_flushPointerEventQueue);
    _pendingPointerEvents.addFirst(PointerCancelEvent(pointer: pointer));
  }

  void _flushPointerEventQueue() {
    assert(!locked);
    while (_pendingPointerEvents.isNotEmpty) {
      handlePointerEvent(_pendingPointerEvents.removeFirst());
    }
  }

  final Map<int, HitTestResult> _hitTests = <int, HitTestResult>{};

  void _handleSampleTimeChanged() {
    if (!locked) {
      if (resamplingEnabled) {
        _resample.sample(samplingOffset, _samplingClock);
      } else {
        _resample.stop();
      }
    }
  }

  SamplingClock get _samplingClock {
    SamplingClock value = SamplingClock();
    assert(() {
      final SamplingClock? debugValue = debugSamplingClock;
      if (debugValue != null) value = debugValue;
      return true;
    }());
    return value;
  }

  late final _Resample _resample = _Resample(
    _handlePointerEventImmediately,
    _handleSampleTimeChanged,
    _samplingInterval,
  );

  @override
  void handlePointerEvent(PointerEvent event) {
    assert(!locked);

    if (resamplingEnabled) {
      _resample.addOrDispatch(event);
      _resample.sample(samplingOffset, _samplingClock);
      return;
    }

    // Stop reSampler if resampling is not enabled. This is a no-op if
    // resampling was never enabled.
    _resample.stop();
    _handlePointerEventImmediately(event);
  }

  void _handlePointerEventImmediately(PointerEvent event) {
    HitTestResult? hitTestResult;
    if (event is PointerDownEvent || event is PointerSignalEvent || event is PointerHoverEvent) {
      assert(!_hitTests.containsKey(event.pointer));
      hitTestResult = HitTestResult();
      hitTest(hitTestResult, event.position);
      if (event is PointerDownEvent) {
        _hitTests[event.pointer] = hitTestResult;
      }
      assert(() {
        if (debugPrintHitTestResults) debugPrint('$event: $hitTestResult');
        return true;
      }());
    } else if (event is PointerUpEvent || event is PointerCancelEvent) {
      hitTestResult = _hitTests.remove(event.pointer);
    } else if (event.down) {
      // Because events that occur with the pointer down (like
      // [PointerMoveEvent]s) should be dispatched to the same place that their
      // initial PointerDownEvent was, we want to re-use the path we found when
      // the pointer went down, rather than do hit detection each time we get
      // such an event.
      hitTestResult = _hitTests[event.pointer];
    }
    assert(() {
      if (debugPrintMouseHoverEvents && event is PointerHoverEvent) debugPrint('$event');
      return true;
    }());
    if (hitTestResult != null || event is PointerAddedEvent || event is PointerRemovedEvent) {
      dispatchEvent(event, hitTestResult);
    }
  }

  double get adapterDevicePixelRatio {
    if (UIKitScreenInfo.initialed) return UIKitScreenInfo.instance.actualPixelRatio;
    final designSize = UIKit().designSize!;
    double adapterDevicePixelRatio;
    var deviceShortWidth = ui.window.physicalSize.width <= ui.window.physicalSize.height ? ui.window.physicalSize.width : ui.window.physicalSize.height;
    adapterDevicePixelRatio = deviceShortWidth / designSize.width;
    return adapterDevicePixelRatio;
  }
}

///now  flutter --version 2.3.0-0.1.pre
const Duration _samplingInterval = Duration(microseconds: 16667);

typedef _HandleSampleTimeChangedCallback = void Function();

class _Resample {
  _Resample(this._handlePointerEvent, this._handleSampleTimeChanged, this._samplingInterval);

  // _ReSampler used to filter incoming pointer events.
  final Map<int, PointerEventResampler> _resample = <int, PointerEventResampler>{};

  // Flag to track if a frame callback has been scheduled.
  bool _frameCallbackScheduled = false;

  // Last frame time for resampling.
  Duration _frameTime = Duration.zero;

  // Time since `_frameTime` was updated.
  Stopwatch _frameTimeAge = Stopwatch();

  // Last sample time and time stamp of last event.
  //
  // Only used for debugPrint of resampling margin.
  Duration _lastSampleTime = Duration.zero;
  Duration _lastEventTime = Duration.zero;

  // Callback used to handle pointer events.
  final HandleEventCallback _handlePointerEvent;

  // Callback used to handle sample time changes.
  final _HandleSampleTimeChangedCallback _handleSampleTimeChanged;

  // Interval used for sampling.
  final Duration _samplingInterval;

  // Timer used to schedule resampling.
  Timer? _timer;

  // Add `event` for resampling or dispatch it directly if
  // not a touch event.
  void addOrDispatch(PointerEvent event) {
    final SchedulerBinding scheduler = SchedulerBinding.instance;
    // Add touch event to resampler or dispatch pointer event directly.
    if (event.kind == PointerDeviceKind.touch) {
      // Save last event time for debugPrint of resampling margin.
      _lastEventTime = event.timeStamp;

      final PointerEventResampler resample = _resample.putIfAbsent(
        event.device,
        () => PointerEventResampler(),
      );
      resample.addEvent(event);
    } else {
      _handlePointerEvent(event);
    }
  }

  // Sample and dispatch events.
  //
  // The `samplingOffset` is relative to the current frame time, which
  // can be in the past when we're not actively resampling.
  // The `samplingClock` is the clock used to determine frame time age.
  void sample(Duration samplingOffset, SamplingClock clock) {
    final SchedulerBinding scheduler = SchedulerBinding.instance;

    // Initialize `_frameTime` if needed. This will be used for periodic
    // sampling when frame callbacks are not received.
    if (_frameTime == Duration.zero) {
      _frameTime = Duration(milliseconds: clock.now().millisecondsSinceEpoch);
      _frameTimeAge = clock.stopwatch()..start();
    }

    // Schedule periodic resampling if `_timer` is not already active.
    if (_timer?.isActive != true) {
      _timer = Timer.periodic(_samplingInterval, (_) => _onSampleTimeChanged());
    }

    // Calculate the effective frame time by taking the number
    // of sampling intervals since last time `_frameTime` was
    // updated into account. This allows us to advance sample
    // time without having to receive frame callbacks.
    final int samplingIntervalUs = _samplingInterval.inMicroseconds;
    final int elapsedIntervals = _frameTimeAge.elapsedMicroseconds ~/ samplingIntervalUs;
    final int elapsedUs = elapsedIntervals * samplingIntervalUs;
    final Duration frameTime = _frameTime + Duration(microseconds: elapsedUs);

    // Determine sample time by adding the offset to the current
    // frame time. This is expected to be in the past and not
    // result in any dispatched events unless we're actively
    // resampling events.
    final Duration sampleTime = frameTime + samplingOffset;

    // Determine next sample time by adding the sampling interval
    // to the current sample time.
    final Duration nextSampleTime = sampleTime + _samplingInterval;

    // Iterate over active resamplers and sample pointer events for
    // current sample time.
    for (final PointerEventResampler resample in _resample.values) {
      resample.sample(sampleTime, nextSampleTime, _handlePointerEvent);
    }

    // Remove inactive resamplers.
    _resample.removeWhere((int key, PointerEventResampler resample) {
      return !resample.hasPendingEvents && !resample.isDown;
    });

    // Save last sample time for debugPrint of resampling margin.
    _lastSampleTime = sampleTime;

    // Early out if another call to `sample` isn't needed.
    if (_resample.isEmpty) {
      _timer!.cancel();
      return;
    }

    // Schedule a frame callback if another call to `sample` is needed.
    if (!_frameCallbackScheduled) {
      _frameCallbackScheduled = true;
      // Add a post frame callback as this avoids producing unnecessary
      // frames but ensures that sampling phase is adjusted to frame
      // time when frames are produced.
      scheduler.addPostFrameCallback((_) {
        _frameCallbackScheduled = false;
        // We use `currentSystemFrameTimeStamp` here as it's critical that
        // sample time is in the same clock as the event time stamps, and
        // never adjusted or scaled like `currentFrameTimeStamp`.
        _frameTime = scheduler.currentSystemFrameTimeStamp;
        _frameTimeAge.reset();
        // Reset timer to match phase of latest frame callback.
        _timer?.cancel();
        _timer = Timer.periodic(_samplingInterval, (_) => _onSampleTimeChanged());
        // Trigger an immediate sample time change.
        _onSampleTimeChanged();
      });
    }
  }

  // Stop all resampling and dispatched any queued events.
  void stop() {
    for (final PointerEventResampler resample in _resample.values) {
      resample.stop(_handlePointerEvent);
    }
    _resample.clear();
    _frameTime = Duration.zero;
  }

  void _onSampleTimeChanged() {
    assert(() {
      if (debugPrintResamplingMargin) {
        final Duration resamplingMargin = _lastEventTime - _lastSampleTime;
        debugPrint('$resamplingMargin');
      }
      return true;
    }());
    _handleSampleTimeChanged();
  }
}
