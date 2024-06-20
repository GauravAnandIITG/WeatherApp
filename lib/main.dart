import 'package:flutter/material.dart';
import 'screens/user_profile_screen.dart';
import 'screens/main_weather_screen.dart';
import 'screens/profile_display_screen.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => UserProfileScreen(),
        'displayProfile': (context) => ProfileDisplayScreen(),
        'details': (context) => MainWeatherScreen(),
        //"expand": (context) => DetailWeatherScreen(city: 'location',)
      },
    );
  }
}
