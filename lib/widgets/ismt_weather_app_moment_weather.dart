import 'package:flutter/material.dart';
import '../models/ismt_weather_app_moment_weather_model.dart';

MomentWeather? dataMomentWeather;
Widget momentWeather(String temp, String location) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          temp,
          style: const TextStyle(
            fontSize: 48,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          location,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.blueAccent,
          ),
        ),
      ],
    ),
  );
}
