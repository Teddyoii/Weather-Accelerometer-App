import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../../../utils/accelerometer_utils.dart';

class AccelerometerExample extends StatefulWidget {
  const AccelerometerExample({Key? key}) : super(key: key);

  @override
  State<AccelerometerExample> createState() => _AccelerometerExampleState();
}

class _AccelerometerExampleState extends State<AccelerometerExample> {
  late AccelerometerService _accelerometerService;
  List<AccelerometerEvent> _accelerometerValues = [];

  @override
  void initState() {
    super.initState();
    _accelerometerService = AccelerometerService();
    _accelerometerService.startListening(_updateAccelerometer);
  }

  @override
  void dispose() {
    _accelerometerService.stopListening();
    super.dispose();
  }

  void _updateAccelerometer(List<AccelerometerEvent> events) {
    setState(() {
      _accelerometerValues = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Accelerometer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Accelerometer Data:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            if (_accelerometerValues.isNotEmpty)
              Text(
                'X: ${_accelerometerValues[0].x.toStringAsFixed(2)}, '
                'Y: ${_accelerometerValues[0].y.toStringAsFixed(2)}, '
                'Z: ${_accelerometerValues[0].z.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16),
              )
            else
              Text('No data available', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
