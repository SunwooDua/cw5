import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(Aquarium());
}

class Aquarium extends StatelessWidget {
  const Aquarium({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Aquarium',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AquariumScreen(),
    );
  }
}

class AquariumScreen extends StatefulWidget {
  const AquariumScreen({super.key});

  @override
  State<AquariumScreen> createState() => _AquariumScreenState();
}

class _AquariumScreenState extends State<AquariumScreen> {
  List<Widget> fishList = [];

  void _addFish() {
    if (fishList.length < 10) {
      // Limiting to 10 fish
      setState(() {
        fishList.add(
          Positioned(
            left: Random().nextDouble() * 300,
            top: Random().nextDouble() * 300,
            child: Icon(Icons.circle, color: Colors.yellow, size: 20),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aquarium'), backgroundColor: Colors.blue),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Stack(children: fishList),
              ),
            ),
          ),
          ElevatedButton(onPressed: _addFish, child: Text('Add Fish to Tank')),
        ],
      ),
    );
  }
}
