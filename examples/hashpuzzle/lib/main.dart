import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TimelockPuzzleApp());
}

class TimelockPuzzleApp extends StatelessWidget {
  const TimelockPuzzleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Timelock Puzzle',
      home: PuzzleHomePage(),
    );
  }
}

class PuzzleHomePage extends StatefulWidget {
  const PuzzleHomePage({super.key});

  @override
  _PuzzleHomePageState createState() => _PuzzleHomePageState();
}

class _PuzzleHomePageState extends State<PuzzleHomePage> {
  final TextEditingController _zerosController = TextEditingController();
  String _result = "";
  String key = ""; // Key is now initialized empty

  @override
  void initState() {
    super.initState();
    generateKey(); // Generate initial key on startup
  }

  String generateKey() {
    const String chars =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()-_=+";
    Random rnd = Random.secure();
    key = List.generate(32, (index) => chars[rnd.nextInt(chars.length)]).join();
    return key;
  }

  String computeHash(String input) {
    return sha256.convert(utf8.encode(input)).toString();
  }

  bool verifyHash(String key, int numberOfZeroes, String nonce) {
    String input = nonce + key;
    String hash = computeHash(input);
    String prefix = '0' * numberOfZeroes;
    return hash.startsWith(prefix);
  }

  void findNonce() {
    generateKey(); // Generate a new key each time the computation starts
    int numberOfZeroes = int.tryParse(_zerosController.text) ?? 0;
    int nonce = 0;
    Stopwatch stopwatch = Stopwatch()..start();
    while (true) {
      if (verifyHash(key, numberOfZeroes, nonce.toString())) {
        stopwatch.stop();
        setState(() {
          _result =
              "Puzzle solved!\nKey: $key\nNonce: $nonce\nElapsed Time: ${stopwatch.elapsedMilliseconds} ms\nAttempts: $nonce";
        });
        break;
      }
      nonce++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timelock Puzzle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _zerosController,
              decoration: const InputDecoration(
                labelText: 'Enter number of leading zeros',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: findNonce,
              child: const Text('Start Computation'),
            ),
            const SizedBox(height: 20),
            Text(_result,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
