import 'package:flutter/material.dart';
import 'bubble_type.dart';
import 'chat_bubble_clipper_5.dart';
class ChatBubble extends StatelessWidget {
  final CustomClipper? clipper;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final Color? backGroundColor;
  final Color? shadowColor;
  final Alignment? alignment;
  final EdgeInsetsGeometry? padding;

  ChatBubble(
      {this.clipper,
      this.child,
      this.margin,
      this.elevation,
      this.backGroundColor,
      this.shadowColor,
      this.alignment,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment ?? Alignment.topLeft,
      margin: margin ?? EdgeInsets.all(0),
      child: PhysicalShape(
        clipper: clipper as CustomClipper<Path>,
        elevation: elevation ?? 2,
        color: backGroundColor ?? Colors.blue,
        shadowColor: shadowColor ?? Colors.grey.shade200,
        child: Padding(
          padding: padding ?? setPadding(),
          child: child ?? Container(),
        ),
      ),
    );
  }

  EdgeInsets setPadding() {
    if (clipper is ChatBubbleClipper5) {
      if ((clipper as ChatBubbleClipper5).type == BubbleType.sendBubble) {
        return const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 15);
      } else {
        return const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 10);
      }
    }
    return const EdgeInsets.all(10);
  }
}
