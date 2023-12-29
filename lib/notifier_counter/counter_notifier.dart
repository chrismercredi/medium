import 'package:flutter/material.dart';

/// A [ValueNotifier] for managing a counter value.
///
/// This class extends [ValueNotifier<int>] and manages a counter
/// with methods to increment, decrement, and reset its value.
///
/// Example:
/// ```dart
/// final counterNotifier = CounterNotifier();
/// counterNotifier.increment();
/// print(counterNotifier.value); // 1
/// counterNotifier.decrement();
/// print(counterNotifier.value); // 0
/// counterNotifier.reset();
/// print(counterNotifier.value); // 0
/// ```
class CounterNotifier extends ValueNotifier<int> {
  /// Creates a [CounterNotifier] with an initial value of 0.
  CounterNotifier() : super(0);

  /// Increments the counter by 1.
  ///
  /// Each call to this method increases the [value] of the counter
  /// by one and notifies all listeners about the change.
  ///
  /// Example:
  /// ```dart
  /// final counterNotifier = CounterNotifier();
  /// counterNotifier.increment();
  /// print(counterNotifier.value); // 1
  /// ```
  void increment() {
    value++;
  }

  /// Decrements the counter by 1.
  ///
  /// Each call to this method decreases the [value] of the counter
  /// by one and notifies all listeners about the change.
  /// This method will not decrease the value below 0.
  ///
  /// Example:
  /// ```dart
  /// final counterNotifier = CounterNotifier();
  /// counterNotifier.decrement();
  /// print(counterNotifier.value); // 0
  /// ```
  void decrement() {
    if (value > 0) {
      value--;
    }
  }

  /// Resets the counter to 0.
  ///
  /// Calling this method sets the [value] of the counter back to 0
  /// and notifies all listeners about the change.
  ///
  /// Example:
  /// ```dart
  /// final counterNotifier = CounterNotifier();
  /// counterNotifier.reset();
  /// print(counterNotifier.value); // 0
  /// ```
  void reset() {
    value = 0;
  }
}
