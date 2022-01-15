import 'package:flutter/material.dart';

class DragWidgetPage extends StatefulWidget {
  const DragWidgetPage({Key? key}) : super(key: key);

  @override
  _DragWidgetPageState createState() => _DragWidgetPageState();
}

class _DragWidgetPageState extends State<DragWidgetPage> {
  Offset offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: offset.dx,
            top: offset.dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                offset = offset + details.delta;
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                height: 100,
                width: 100,
                child: const Text(
                  'Drag me!',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
