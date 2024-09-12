import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dev_test/src/features/weather/presentation/accelerometer.dart';
import 'package:dev_test/src/features/weather/presentation/weather_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // Replace the below placeholder with your accelerometer page
    AccelerometerExample(),
    WeatherPage(city: 'Colombo'),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyleWithShadow = TextStyle(color: Colors.white, shadows: [
      BoxShadow(
        color: Colors.black12.withOpacity(0.25),
        spreadRadius: 1,
        blurRadius: 4,
        offset: const Offset(0, 0.5),
      )
    ]);
    return MaterialApp(
      title: 'Dev Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
          displayLarge: textStyleWithShadow,
          displayMedium: textStyleWithShadow,
          displaySmall: textStyleWithShadow,
          headlineMedium: textStyleWithShadow,
          headlineSmall: textStyleWithShadow,
          titleMedium: const TextStyle(color: Colors.white),
          bodyMedium: const TextStyle(color: Colors.white),
          bodyLarge: const TextStyle(color: Colors.white),
          bodySmall: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ),
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new),
              label: 'Accelerometer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud),
              label: 'Weather',
            ),
          ],
        ),
      ),
    );
  }
}
