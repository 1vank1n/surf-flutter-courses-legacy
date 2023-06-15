import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: GestureMaster(
          width: screenWidth,
          height: screenHeight,
        ),
      ),
    );
  }
}

class GestureMaster extends StatefulWidget {
  final double width;
  final double height;

  const GestureMaster({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<GestureMaster> createState() => _GestureMasterState();
}

class _GestureMasterState extends State<GestureMaster> with TickerProviderStateMixin {
  final double objectWidth = 100.0;
  final double objectHeight = 100.0;
  double objectRotate = 0.0;
  Color objectColor = Colors.black12;
  late AnimationController objectRotationController;

  double _objectX = 0;
  double get objectX => _objectX;
  set objectX(double value) {
    if (0 < value && value < widget.width - objectWidth) {
      _objectX = value;
    }
  }

  double _objectY = 0;
  double get objectY => _objectY;
  set objectY(double value) {
    if (0 < value && value < widget.height - objectHeight) {
      _objectY = value;
    }
  }

  @override
  void initState() {
    super.initState();
    objectRotationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    placeObjectToCenter();
  }

  void changeObject() {
    setState(() {
      objectColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  void dragObject(DragUpdateDetails details) {
    setState(() {
      objectY += details.delta.dy;
      objectX += details.delta.dx;
    });
  }

  void startRotateObject(_) {
    objectRotationController.repeat();
  }

  void endRotateObject(_) {
    objectRotationController.stop();
  }

  void placeObjectToCenter() {
    setState(() {
      objectX = (widget.width - objectWidth) / 2;
      objectY = (widget.height - objectHeight) / 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: objectY,
          left: objectX,
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(objectRotationController),
            child: AnimatedContainer(
              width: objectWidth,
              height: objectHeight,
              color: objectColor,
              duration: const Duration(milliseconds: 500),
              child: const Center(
                child: Text(
                  '👍',
                  style: TextStyle(fontSize: 60.0),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: GestureDetector(
            onTap: changeObject,
            onVerticalDragUpdate: dragObject,
            onHorizontalDragUpdate: dragObject,
            onLongPressStart: startRotateObject,
            onLongPressEnd: endRotateObject,
          ),
        ),
      ],
    );
  }
}
