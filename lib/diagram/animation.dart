import 'package:flutter/material.dart';

import 'AW.dart';

class DiagramAnimationWidget extends StatefulWidget {
  final List<double> dataStart;
  final List<double> dataEnd;

  const DiagramAnimationWidget(
      {super.key, required this.dataStart, required this.dataEnd});

  @override
  State<DiagramAnimationWidget> createState() => _DiagramAnimationWidgetState();
}

class _DiagramAnimationWidgetState extends State<DiagramAnimationWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
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
        children: [
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 150; i >= 0; i -= 30)
                  SizedBox(
                    height: 30,
                    child: Text('$i' '_'),
                  ),
              ],
            ),
          ),
          for (int i = 0; i < widget.dataStart.length; i++)
            DiagramAW(
                dataStart: widget.dataStart[i],
                dataEnd: widget.dataEnd[i],
                animation: animation)
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
