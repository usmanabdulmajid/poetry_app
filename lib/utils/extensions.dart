import 'package:flutter/cupertino.dart';

extension BuildContextExtensions on BuildContext {
  double screenHeight([double percent = 1]) => _height * percent;
  double screenWidth([double percent = 1]) => _width * percent;
  double get _height => MediaQuery.of(this).size.height;
  double get _width => MediaQuery.of(this).size.width;
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
}
