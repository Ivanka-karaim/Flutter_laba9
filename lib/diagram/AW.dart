import 'package:flutter/material.dart';

import 'style.dart';

class DiagramAW extends AnimatedWidget {
  final double dataStart;
  final double dataEnd;

  const DiagramAW(
      {super.key, required this.dataStart, required this.dataEnd, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final sizeTween = Tween<double>(begin: dataStart, end: dataEnd);
    Animation<Color?> color =
    ColorTween(begin: Colors.red, end: Colors.yellow).animate(animation);

    return Diagram(
        height: sizeTween.evaluate(animation), color: color.value as Color);
  }
}