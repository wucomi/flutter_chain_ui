import 'package:flutter/material.dart';
import 'package:flutter_chain_ui/dynamic_widget.dart';

extension DynamicWidgetExtension on Widget {
  Widget margin(dynamic margin) {
    if (this is DynamicWidget) {
      return (this as DynamicWidget).copyWith(margin: margin);
    } else {
      return DynamicWidget(margin: margin, child: this);
    }
  }

  Widget padding(dynamic padding) {
    if (this is DynamicWidget) {
      return (this as DynamicWidget).copyWith(padding: padding);
    } else {
      return DynamicWidget(padding: padding, child: this);
    }
  }

  Widget width(dynamic width) {
    if (this is DynamicWidget) {
      return (this as DynamicWidget).copyWith(width: width);
    } else {
      return DynamicWidget(width: width, child: this);
    }
  }

  Widget height(dynamic height) {
    if (this is DynamicWidget) {
      return (this as DynamicWidget).copyWith(height: height);
    } else {
      return DynamicWidget(height: height, child: this);
    }
  }

  Widget aspectRatio(double aspectRatio) {
    if (this is DynamicWidget) {
      return (this as DynamicWidget).copyWith(aspectRatio: aspectRatio);
    } else {
      return DynamicWidget(aspectRatio: aspectRatio, child: this);
    }
  }

  Widget alignment(AlignmentGeometry alignment) {
    if (this is DynamicWidget) {
      return (this as DynamicWidget).copyWith(alignment: alignment);
    } else {
      return DynamicWidget(alignment: alignment, child: this);
    }
  }

  Widget decoration(Decoration decoration) {
    if (this is DynamicWidget) {
      return (this as DynamicWidget).copyWith(decoration: decoration);
    } else {
      return DynamicWidget(decoration: decoration, child: this);
    }
  }

  Widget backgroundColor(Color color) {
    if (this is DynamicWidget) {
      return (this as DynamicWidget).copyWith(backgroundColor: color);
    } else {
      return DynamicWidget(backgroundColor: color, child: this);
    }
  }

  Widget borderRadius(dynamic borderRadius) {
    if (this is DynamicWidget) {
      return (this as DynamicWidget).copyWith(borderRadius: borderRadius);
    } else {
      return DynamicWidget(borderRadius: borderRadius, child: this);
    }
  }

  Widget boxShadow(List<BoxShadow> boxShadow) {
    if (this is DynamicWidget) {
      return (this as DynamicWidget).copyWith(boxShadow: boxShadow);
    } else {
      return DynamicWidget(boxShadow: boxShadow, child: this);
    }
  }

  Widget flex(int flex) {
    if (this is DynamicWidget) {
      return (this as DynamicWidget).copyWith(flex: flex);
    } else {
      return DynamicWidget(flex: flex, child: this);
    }
  }

  Widget visibility(VisibilityState visibility) {
    if (this is DynamicWidget) {
      return (this as DynamicWidget).copyWith(visibility: visibility);
    } else {
      return DynamicWidget(visibility: visibility, child: this);
    }
  }
}
