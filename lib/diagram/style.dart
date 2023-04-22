import 'package:flutter/material.dart';

class Diagram extends StatelessWidget {
  final double height;
  final Color color;

  const Diagram({Key? key, required this.height, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            height: 150,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 40,
                    height: height * 150,
                    decoration: BoxDecoration(
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}