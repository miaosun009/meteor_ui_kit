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
