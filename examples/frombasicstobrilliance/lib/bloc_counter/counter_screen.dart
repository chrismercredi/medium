import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valuenotifiercounterexample/bloc_counter/bloc/counter_bloc.dart';

/// A screen that displays a counter managed by [CounterBloc].
///
/// This screen uses [BlocBuilder] to listen to the state changes in [CounterBloc]
/// and updates the UI accordingly. It displays the current count and provides
/// buttons to increment, decrement, and reset the counter.
class CounterScreen extends StatelessWidget {
  /// Constructs a [CounterScreen].
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // BlocBuilder listens to state changes in CounterBloc
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                // Checks if the current state is CounterValue
                if (state is CounterValue) {
                  // Displays the current count
                  return Text(
                    'Count: ${state.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
                // Fallback text for any unknown state
                return const Text('Unknown state');
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Button to reset the counter
                TextButton(
                  onPressed: () => context.read<CounterBloc>().add(Reset()),
                  child: const Text('Reset'),
                ),
                const SizedBox(width: 8),
                // Button to decrement the counter
                OutlinedButton(
                  onPressed: () => context.read<CounterBloc>().add(Decrement()),
                  child: const Text('Decrement'),
                ),
                const SizedBox(width: 8),
                // Button to increment the counter
                FilledButton(
                  onPressed: () => context.read<CounterBloc>().add(Increment()),
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
