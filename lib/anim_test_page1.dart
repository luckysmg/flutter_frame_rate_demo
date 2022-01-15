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

  @override
  void initState() {
    controller = AnimationController(vsync: this, frameRate: FrameRate.fps30, lowerBound: 0, upperBound: 2 * 3.14159)
      ..addListener(() {
        print("更新");
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: controller.value,
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                height: 100,
                width: 100,
                child: const Text(
                  "30fps",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton.filled(
                child: const Text('enter next page'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return const DragWidgetPage();
                  }));
                })
          ],
        ),
      ),
    );
  }
}
