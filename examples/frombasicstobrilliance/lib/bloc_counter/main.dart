/// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frombasicstobrilliance/bloc_counter/bloc/counter_bloc.dart';

import 'counter_screen.dart'; // Assuming CounterScreen is defined in counter_screen.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const CounterScreen(),
      ), // Use the CounterScreen as the home screen
    );
  }
}
