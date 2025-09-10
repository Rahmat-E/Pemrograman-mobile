import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Row & Column',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grid 2x2 Row & Column'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  KotakCustom(
                    color: Colors.blue,
                    label: "Kotak 1",
                  ),
                  SizedBox(width: 20),
                  KotakCustom(
                    color: Colors.green,
                    label: "Kotak 2",
                  ),
                ],
              ),
              const SizedBox(height: 20),
  
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  KotakCustom(
                    color: Colors.orange,
                    label: "Kotak 3",
                  ),
                  SizedBox(width: 20),
                  KotakCustom(
                    color: Colors.purple,
                    label: "Kotak 4",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KotakCustom extends StatelessWidget {
  final Color color;
  final String label;

  const KotakCustom({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 40,
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}

