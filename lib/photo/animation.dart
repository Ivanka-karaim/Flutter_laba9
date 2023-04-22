import 'package:flutter/material.dart';

import 'AW.dart';

class PhotoAnimationWidget extends StatefulWidget {
  const PhotoAnimationWidget({super.key});

  @override
  State<PhotoAnimationWidget> createState() => _PhotoAnimationWidgetState();
}

class _PhotoAnimationWidgetState extends State<PhotoAnimationWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [PhotoWidgetAW(animation: animation)],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}