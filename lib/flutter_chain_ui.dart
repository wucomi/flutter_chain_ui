import 'package:flutter/material.dart';
import 'package:flutter_chain_ui/dynamic_widget_extension.dart';

import 'dynamic_widget.dart';

export 'dynamic_widget.dart';
export 'dynamic_widget_extension.dart';

class aaa extends StatelessWidget {
  const aaa({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Hello, World!')
        .margin({
          'top': 10, // 固定值
          'left': '10%', // 占父控件比例的10%
          'right': '10%', // 占父控件比例的10%
          'bottom': 10, // 固定值
        })
        .margin('10%') // 全部边距占父控件比例的10%
        .padding({
          'top': 10, // 固定值
          'left': '10%', // 占父控件比例的10%
          'right': '10%', // 占父控件比例的10%
          'bottom': 10, // 固定值
        })
        .padding('10%') // 全部内边距占父控件比例的10%
        .width('100%') // 宽度占父控件的100%
        .height('100%') // 高度占父控件的100%
        .aspectRatio(1) // 宽高比为1
        .alignment(Alignment.center) // 内容居中对齐
        .backgroundColor(Colors.blue) // 背景颜色
        .borderRadius({
          'topLeft': 10, // 左上角圆角半径为10
          'topRight': 20, // 右上角圆角半径为20
          'bottomLeft': 30, // 左下角圆角半径为30
          'bottomRight': 40, // 右下角圆角半径为40
        })
        .boxShadow([
          BoxShadow(
            color: Colors.black.withOpacity(0.5), // 阴影颜色
            blurRadius: 10.0, // 阴影的模糊程度
            spreadRadius: 3.0, // 阴影的扩散范围
            offset: Offset(0, 4), // 阴影的位置偏移
          ),
        ])
        .decoration(
          BoxDecoration(
            color: Colors.blue, // 蓝色背景
            border: Border.all(color: Colors.black, width: 2), // 黑色边框
          ),
        )
        .flex(1) // 如果在 Flex 或 Row/Column 中，占1份
        .visibility(VisibilityState.visible); // 可见
  }
}
