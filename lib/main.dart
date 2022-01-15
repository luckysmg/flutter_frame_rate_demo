import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'anim_test_page1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   final OverlayEntry entry = OverlayEntry(builder: (c) {
    //     return const FPSBar();
    //   });
    //   Overlay.of(context)?.insert(entry);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const AnimationTestPage1()));
          },
          child: Container(
            color: Color.fromARGB(
                255, Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255)),
            padding: const EdgeInsets.all(24.0),
            child: const Text(
              "Tap to enter new test page",
              style: TextStyle(fontSize: 30),
            ),
          ),
        );
      }),
    );
  }
}

class FPSBar extends StatefulWidget {
  const FPSBar({Key? key}) : super(key: key);

  @override
  _FPSBarState createState() => _FPSBarState();
}

class _FPSBarState extends State<FPSBar> {
  Duration lastTime = Duration.zero;
  String fpsString = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      WidgetsBinding.instance!.addPersistentFrameCallback((timeStamp) {
        final Duration diff = timeStamp - lastTime;
        lastTime = timeStamp;
        final int ms = diff.inMilliseconds;
        if(ms == 0){
          return;
        }
        final int fps = (1000 / ms).round();
        setState(() {
          fpsString = "$fps FPS";
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        child: Container(
          alignment: Alignment.center,
          height: 100,
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          child: Text(
            fpsString,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
