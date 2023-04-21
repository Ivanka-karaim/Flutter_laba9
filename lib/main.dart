import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const DiagramWidget(data:[0.1, 0.2, 0.3, 0.4, 0.5]),
    );
  }
}

class BarChart extends StatelessWidget {
  final double height;
  final Color color;

  const BarChart({Key? key, required this.height, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // for (int i = 0; i < data.length; i++)
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 150,
                  decoration: BoxDecoration(
                    // color: Colors.blue[300],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 20,
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
            ));
  }
}

class DiagramWidget extends StatefulWidget {
  final List<double> data;
  const DiagramWidget({super.key, required this.data});

  @override
  State<DiagramWidget> createState() => _DiagramWidgetState();
}

class _DiagramWidgetState extends State<DiagramWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration:const Duration(seconds:10), vsync: this);
    _animations = List.generate(widget.data.length, (index) =>
        CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    )..addStatusListener((status) {
                   if (status == AnimationStatus.completed) {
                     controller.reverse();
                   } else if (status == AnimationStatus.dismissed) {
                     controller.forward();
                   }
                 })).toList();



    controller.forward();

    // super.initState();
    // animationController =
    //     AnimationController(duration: const Duration(seconds: 10), vsync: this);
    // animation =
    //     CurvedAnimation(parent: animationController, curve: Curves.easeIn)
    //       ..addStatusListener((status) {
    //         if (status == AnimationStatus.completed) {
    //           animationController.reverse();
    //         } else if (status == AnimationStatus.dismissed) {
    //           animationController.forward();
    //         }
    //       });
    // animationController.forward();


  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
        body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        for (int i = 0; i < _animations.length; i++)
          AW(data_end:widget.data[i],animation: _animations[i])
    ]));
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
}

class AW extends AnimatedWidget {
  final double data_end;
  const AW({super.key, required this.data_end, required Animation<double> animation})
      : super(listenable: animation);


  static final _colorTween = ColorTween(begin: Colors.red, end: Colors.blue);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final sizeTween = Tween<double>(begin: 0, end: data_end);
    return
            BarChart(height: sizeTween.evaluate(animation), color:_colorTween.evaluate(animation) as Color);
  }
}
