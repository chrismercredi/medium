/// counter_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

/// A Bloc that manages the state of a counter.
///
/// This Bloc listens to [CounterEvent]s and emits [CounterState]s.
/// It starts with an initial state of [CounterValue] with a value of 0.
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  /// Initializes [CounterBloc] with an initial [CounterValue] of 0.
  CounterBloc() : super(CounterValue(0)) {
    on<Increment>((event, emit) {
      final currentState = state;
      if (currentState is CounterValue) {
        // Increments the counter value by 1.
        emit(CounterValue(currentState.value + 1));
      }
    });
    on<Decrement>((event, emit) {
      final currentState = state;
      if (currentState is CounterValue) {
        // Decrements the counter value by 1 but never below 0.
        emit(CounterValue(currentState.value > 0 ? currentState.value - 1 : 0));
      }
    });
    on<Reset>((event, emit) {
      // Resets the counter value to 0.
      emit(CounterValue(0));
    });
  }
}
