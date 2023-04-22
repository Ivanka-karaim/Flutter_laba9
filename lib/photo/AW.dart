import 'package:flutter/material.dart';

class PhotoWidgetAW extends AnimatedWidget {
  const PhotoWidgetAW({super.key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final sizeTween = Tween<double>(begin: 150, end: 300);
    final radiusTween = Tween<double>(begin: 0, end: 150);
    return ClipRRect(
      borderRadius: BorderRadius.circular(radiusTween.evaluate(animation)),
      child: Container(
        width: sizeTween.evaluate(animation),
        height: sizeTween.evaluate(animation),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/my.jpg"),
          ),
        ),
      ),
    );
  }
}
