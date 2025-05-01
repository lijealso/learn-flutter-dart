import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(SpeedApp());
}

class SpeedApp extends StatelessWidget {
  const SpeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speed Estimator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SpeedHomePage(),
    );
  }
}

class SpeedHomePage extends StatefulWidget {
  const SpeedHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SpeedHomePageState createState() => _SpeedHomePageState();
}

class _SpeedHomePageState extends State<SpeedHomePage> {
  double _speed = 0.0; // in m/s
  List<double> _lastAccel = [0.0, 0.0, 0.0];
  late StreamSubscription<AccelerometerEvent> _subscription;
  DateTime? _lastTime;

  @override
  void initState() {
    super.initState();
    _subscription = accelerometerEvents.listen((event) {
      final now = DateTime.now();
      if (_lastTime != null) {
        final dt = now.difference(_lastTime!).inMilliseconds / 1000.0;
        final dx = event.x - _lastAccel[0];
        final dy = event.y - _lastAccel[1];
        final dz = event.z - _lastAccel[2];
        final deltaA = sqrt(dx * dx + dy * dy + dz * dz);
        final speedIncrement = deltaA * dt * 9.81;

        setState(() {
          _speed = max(
            0,
            _speed + speedIncrement - 0.1,
          ); // basic friction model
        });
      }
      _lastAccel = [event.x, event.y, event.z];
      _lastTime = now;
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Estimated Speed')),
      body: Center(
        child: Text(
          '${_speed.toStringAsFixed(2)} m/s',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
