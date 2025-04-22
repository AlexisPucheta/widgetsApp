import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text('Circular progress indicator'),
          SizedBox(height: 20),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.grey,
            color: Colors.blue,
          ),
          SizedBox(height: 20),
          Text('Circular and linear progress controlled'),
          SizedBox(height: 20),
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return value * 2 / 100;
      }).takeWhile((value) {
        return value < 100;
      }),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.black12,
                value: progressValue,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator(
                  minHeight: 5,
                  backgroundColor: Colors.black12,
                  value: progressValue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
