import 'package:meteor_ui_kit/src/core/extra_hit_test_area/flex.dart';
import 'package:meteor_ui_kit/src/core/extra_hit_test_area/sized_box.dart';
import 'package:meteor_ui_kit/src/core/extra_hit_test_area/stack.dart';

class UIFlex extends FlexHitTestWithoutSizeLimit {
  UIFlex({
    super.key,
    required super.direction,
    super.children,
    super.crossAxisAlignment,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
  });
}

class UIRow extends RowHitTestWithoutSizeLimit {
  UIRow({
    super.key,
    super.children,
    super.crossAxisAlignment,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
  });
}

class UIColumn extends ColumnHitTestWithoutSizeLimit {
  UIColumn({
    super.key,
    super.children,
    super.crossAxisAlignment,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
  });
}

class UISizedBox extends SizedBoxHitTestWithoutSizeLimit {
  const UISizedBox({
    super.child,
    super.height,
    super.width,
    super.key,
  });
}

class UIStack extends StackHitTestWithoutSizeLimit {
  UIStack({
    super.alignment,
    super.children,
    super.clipBehavior,
    super.fit,
    super.textDirection,
    super.key,
  });
}
