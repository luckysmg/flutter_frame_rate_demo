import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frame_rate_demo/drag_widget_page.dart';

class AnimationTestPage1 extends StatefulWidget {
  const AnimationTestPage1({Key? key}) : super(key: key);

  @override
  _AnimationTestPage1State createState() => _AnimationTestPage1State();
}

class _AnimationTestPage1State extends State<AnimationTestPage1> with TickerProviderStateMixin {
  late AnimationController controller;

  bool is120HZ = false;
  FrameRate lowFrameRate = FrameRate.fps30;

  @override
  void initState() {
    setupAnimationController();
    super.initState();
  }

  void setupAnimationController() {
    controller = AnimationController(
        vsync: this, frameRate: lowFrameRate, lowerBound: 0, upperBound: 2 * 3.14159)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat(period: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(is120HZ ? "fast rate 120HZ":"low rate 30HZ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: controller.value,
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                height: 150,
                width: 150,
                child: const Text(
                  "Text",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 15),
                color: Colors.orange,
                child: Text(
                  'Make animation frame rate more${is120HZ ? ' slow' : ' fastest'}',
                  style: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  is120HZ = !is120HZ;
                  controller.frameRate = is120HZ ? FrameRate.fastest : lowFrameRate;
                }),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton.filled(
                child: const Text('Enter next page'),
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (ctx) {
                    return const DragWidgetPage();
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
