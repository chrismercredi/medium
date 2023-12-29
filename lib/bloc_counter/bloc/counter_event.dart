part of 'counter_bloc.dart';

/// Abstract class representing the events handled by [CounterBloc].
@immutable
sealed class CounterEvent {}

/// Event to increment the counter.
final class Increment extends CounterEvent {}

/// Event to decrement the counter.
final class Decrement extends CounterEvent {}

/// Event to reset the counter to its initial state.
final class Reset extends CounterEvent {}
