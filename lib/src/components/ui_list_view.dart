import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meteor_ui_kit/foundation.dart';

import '../core/extra_hit_test_area/hit_test.dart';

class UIListView extends ListView with RenderBoxChildrenHitTestWithoutSizeLimit {
  UIListView({
    super.addAutomaticKeepAlives = true,
    super.addRepaintBoundaries = true,
    super.addSemanticIndexes = true,
    super.cacheExtent,
    super.children = const [],
    super.clipBehavior = Clip.hardEdge,
    super.controller,
    super.dragStartBehavior = DragStartBehavior.start,
    super.itemExtent,
    super.key,
    super.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    super.padding,
    super.physics,
    super.primary,
    super.prototypeItem,
    super.restorationId,
    super.reverse = false,
    super.scrollDirection = Axis.vertical,
    super.semanticChildCount,
    super.shrinkWrap = false,
  });

  @override
  bool hitTestChildrenWithoutSizeLimit(
    BoxHitTestResult result, {
    required Offset position,
    required Iterable<RenderBox> children,
  }) {
    final List<RenderBox> normal = <RenderBox>[];
    for (final RenderBox child in children) {
      if ((child is RenderBoxHitTestWithoutSizeLimit) && childIsHit(result, child, position: position)) {
        return true;
      } else {
        normal.insert(0, child);
      }
    }

    for (final RenderBox child in normal) {
      if (childIsHit(result, child, position: position)) {
        return true;
      }
    }

    return false;
  }

  @override
  bool childIsHit(BoxHitTestResult result, RenderBox child, {required Offset position}) {
    print("33333");
    final ContainerParentDataMixin<RenderBox> childParentData = child.parentData as ContainerParentDataMixin<RenderBox>;
    final Offset offset = (childParentData as BoxParentData).offset;
    final bool isHit = result.addWithPaintOffset(
      offset: offset,
      position: position,
      hitTest: (BoxHitTestResult result, Offset transformed) {
        assert(transformed == position - offset);
        return child.hitTest(result, position: transformed);
      },
    );
    return isHit;
  }
}
