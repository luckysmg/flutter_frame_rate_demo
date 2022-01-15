import 'package:flutter/material.dart';

class AnimationTestPage1 extends StatefulWidget {
  const AnimationTestPage1({Key? key}) : super(key: key);

  @override
  _AnimationTestPage1State createState() => _AnimationTestPage1State();
}

class _AnimationTestPage1State extends State<AnimationTestPage1> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, frameRate: FrameRate.fps30, lowerBound: 0, upperBound: 2 * 3.14159)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat(period: const Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Transform.rotate(
          angle: controller.value,
          child: Container(
            color: Colors.red,
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
