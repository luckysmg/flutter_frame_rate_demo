import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'anim_test_page1.dart';

void main() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(builder: (_) => const AnimationTestPage1()));
          },
          child: Container(
            color: Color.fromARGB(
                255, Random.secure().nextInt(255), Random.secure().nextInt(255), Random.secure().nextInt(255)),
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "Tap to enter new test page",
              style: const TextStyle(fontSize: 30),
            ),
          ),
        );
      }),
    );
  }
}
