import 'package:flutter/material.dart';

enum VisibilityState {
  visible, // 可见
  hidden, // 隐藏但占位
  gone, // 隐藏且不占位
}

class DynamicWidget extends StatelessWidget {
  final Widget child;
  final dynamic padding; // 支持数字、百分比字符串或 Map
  final dynamic margin; // 支持数字、百分比字符串或 Map
  final dynamic width; // 支持数字或百分比字符串
  final dynamic height; // 支持数字或百分比字符串
  final double? aspectRatio;
  final AlignmentGeometry? alignment;
  final Decoration? decoration;
  final Color? backgroundColor;
  final dynamic borderRadius; // 支持数字、百分比字符串或 Map
  final List<BoxShadow>? boxShadow;
  final int? flex;
  final VisibilityState visibility;

  const DynamicWidget({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.aspectRatio,
    this.alignment,
    this.decoration,
    this.backgroundColor,
    this.borderRadius,
    this.boxShadow,
    this.flex,
    this.visibility = VisibilityState.visible,
  });

  // 解析动态值（支持数字或百分比字符串）
  double? _parseDynamicValue(dynamic value, double baseValue) {
    if (value is String) {
      double percent = double.parse(value.replaceAll('%', '')) / 100;
      return baseValue * percent;
    } else if (value is double) {
      return value;
    }
    return null;
  }

  // 解析 EdgeInsets
  EdgeInsets _parseEdgeInsets(dynamic value, double baseWidth, double baseHeight) {
    if (value is Map) {
      return EdgeInsets.only(
        top: _parseDynamicValue(value['top'], baseHeight) ?? 0,
        left: _parseDynamicValue(value['left'], baseWidth) ?? 0,
        right: _parseDynamicValue(value['right'], baseWidth) ?? 0,
        bottom: _parseDynamicValue(value['bottom'], baseHeight) ?? 0,
      );
    } else if (value is String || value is double) {
      double size = _parseDynamicValue(value, baseWidth) ?? 0;
      return EdgeInsets.all(size);
    }
    return EdgeInsets.zero;
  }

  // 解析 BorderRadius
  BorderRadius? _parseBorderRadius(dynamic borderRadius, double baseValue) {
    if (borderRadius is Map) {
      return BorderRadius.only(
        topLeft: Radius.circular(_parseDynamicValue(borderRadius['topLeft'], baseValue) ?? 0),
        topRight: Radius.circular(_parseDynamicValue(borderRadius['topRight'], baseValue) ?? 0),
        bottomLeft: Radius.circular(_parseDynamicValue(borderRadius['bottomLeft'], baseValue) ?? 0),
        bottomRight: Radius.circular(_parseDynamicValue(borderRadius['bottomRight'], baseValue) ?? 0),
      );
    } else if (borderRadius is String || borderRadius is double) {
      double radius = _parseDynamicValue(borderRadius, baseValue) ?? 0;
      return BorderRadius.all(Radius.circular(radius));
    }
    return null;
  }

  Widget _createContainer({
    required BuildContext context,
    required Widget child,
    double maxWidth = 0,
    double maxHeight = 0,
  }) {
    double? calculatedWidth = _parseDynamicValue(width, maxWidth);
    double? calculatedHeight = _parseDynamicValue(height, maxHeight);

    EdgeInsets calculatedPadding = _parseEdgeInsets(padding, maxWidth, maxHeight);
    EdgeInsets calculatedMargin = _parseEdgeInsets(margin, maxWidth, maxHeight);

    BorderRadius? calculatedBorderRadius = _parseBorderRadius(borderRadius, maxWidth);

    return Container(
      margin: calculatedMargin,
      padding: calculatedPadding,
      width: calculatedWidth,
      height: calculatedHeight,
      alignment: alignment,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: calculatedBorderRadius,
        boxShadow: boxShadow,
      ),
      child: aspectRatio != null ? AspectRatio(aspectRatio: aspectRatio!, child: child) : child,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool useLayoutBuilder = width is String ||
        height is String ||
        padding is String || padding is Map ||
        margin is String || margin is Map ||
        borderRadius is String || borderRadius is Map;

    Widget content = useLayoutBuilder
        ? LayoutBuilder(
      builder: (context, constraints) => _createContainer(
        context: context,
        child: child,
        maxWidth: constraints.maxWidth,
        maxHeight: constraints.maxHeight,
      ),
    )
        : _createContainer(
      context: context,
      child: child,
    );

    switch (visibility) {
      case VisibilityState.visible:
        return content;
      case VisibilityState.hidden:
        return Visibility(visible: false, child: content);
      case VisibilityState.gone:
        return Offstage(offstage: true, child: content);
    }
  }

  DynamicWidget copyWith({
    Widget? child,
    dynamic padding,
    dynamic margin,
    dynamic width,
    dynamic height,
    double? aspectRatio,
    AlignmentGeometry? alignment,
    Decoration? decoration,
    Color? backgroundColor,
    dynamic borderRadius,
    List<BoxShadow>? boxShadow,
    int? flex,
    VisibilityState? visibility,
  }) {
    return DynamicWidget(
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      width: width ?? this.width,
      height: height ?? this.height,
      aspectRatio: aspectRatio ?? this.aspectRatio,
      alignment: alignment ?? this.alignment,
      decoration: decoration ?? this.decoration,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      boxShadow: boxShadow ?? this.boxShadow,
      flex: flex ?? this.flex,
      visibility: visibility ?? this.visibility,
      child: child ?? this.child,
    );
  }
}