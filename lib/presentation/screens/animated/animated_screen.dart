import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10;

  void changeShape() {
    final random = Random();
    width = random.nextInt(300).toDouble() + 50;
    height = random.nextInt(300).toDouble() + 50;
    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      random.nextDouble(),
    );
    borderRadius = random.nextInt(100).toDouble() + 10;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
