import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ValueNotifier<double> _valueNotifier;
  double counter = 0.0;
  final double maxCount = 33.0;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier(0.0);
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  void incrementCounter() {
    setState(() {
      if (counter < maxCount) {
        counter++;
        _valueNotifier.value = (counter / maxCount) * 100;
      }
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0.0;
      _valueNotifier.value = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 119, 210, 145)),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 119, 210, 145),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${counter.round()}',
                  style: const TextStyle(fontSize: 50, color: Colors.black),
                ),
                const SizedBox(height: 20),
                SimpleCircularProgressBar(
                  progressColors: [Colors.amberAccent.shade400],
                  size: 300,
                  progressStrokeWidth: 20,
                  backStrokeWidth: 10,
                  mergeMode: true,
                  maxValue: 100,
                  animationDuration: 0,
                  valueNotifier: _valueNotifier,
                  onGetText: (value) {
                    // value = persen (0-100)
                    double displayed = (value / 100) * maxCount;
                    return Text(
                      '${displayed.round()}',
                      style: const TextStyle(
                          fontSize: 170, color: Colors.black),
                    );
                  },
                ),
                const SizedBox(height: 50),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: InkWell(
                    onTap: incrementCounter,
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: const Icon(
                        Icons.fingerprint,
                        size: 125,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: resetCounter,
          child: const Icon(Icons.refresh_outlined),
        ),
      ),
    );
  }
}
