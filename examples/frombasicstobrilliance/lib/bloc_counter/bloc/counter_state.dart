part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

/// Initial state of [CounterBloc].
///
/// This state is used to represent the initial state of the counter
/// before any events are processed.
final class CounterInitial extends CounterState {}

/// State representing the current value of the counter.
///
/// Includes a [value] field to represent the counter's numeric value.
final class CounterValue extends CounterState {
  final int value;

  /// Constructs a [CounterValue] state with the given [value].
  CounterValue(this.value);
}
