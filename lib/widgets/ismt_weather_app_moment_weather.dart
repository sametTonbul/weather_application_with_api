import 'package:flutter/material.dart';

Widget momentWeather(IconData icon, String temp, String location) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.orange,
          size: 64,
        ),
        const SizedBox(
          height: 10.0,
        ),
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
