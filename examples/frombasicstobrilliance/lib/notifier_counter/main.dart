import 'package:flutter/material.dart';

import 'counter_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  CounterScreen({Key? key}) : super(key: key);

  final CounterNotifier counterNotifier = CounterNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Notifier'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ValueListenableBuilder<int>(
              valueListenable: counterNotifier,
              builder: (context, count, child) {
                return Text(
                  'Count: $count',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  onPressed: counterNotifier.reset,
                  child: const Text('Reset'),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: counterNotifier.decrement,
                  child: const Text('Decrement'),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: counterNotifier.increment,
                  child: const Text('Increment'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
