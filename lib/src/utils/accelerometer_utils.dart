import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';

typedef AccelerometerListener = void Function(List<AccelerometerEvent> events);

class AccelerometerService {
  late StreamSubscription<AccelerometerEvent> _subscription;

  void startListening(AccelerometerListener listener) {
    _subscription = accelerometerEvents.listen((event) {
      listener([event]);
    });
  }

  void stopListening() {
    _subscription.cancel();
  }
}