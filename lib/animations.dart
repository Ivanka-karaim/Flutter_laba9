import 'package:flutter/material.dart';

import 'diagram/animation.dart';
import 'photo/animation.dart';

class Animations extends StatelessWidget {
  const Animations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 400,
          child: DiagramAnimationWidget(
            dataStart: [0.4, 0.05, 0.15, 0.3, 0.3],
            dataEnd: [1, 0.2, 0.3, 0.15, 0.5],
          ),
        ),
        SizedBox(
          height: 400,
          child: PhotoAnimationWidget(),
        ),
      ],
    );
  }
}