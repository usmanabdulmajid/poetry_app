import 'package:flutter/material.dart';

class YGap extends StatelessWidget {
  final double y;
  const YGap(this.y, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
}

class XGap extends StatelessWidget {
  final double x;
  const XGap(this.x, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x);
  }
}
