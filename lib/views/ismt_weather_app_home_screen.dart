import 'package:flutter/material.dart';
import 'package:flutter_ismt_weather_application/models/ismt_weather_app_moment_weather_model.dart';
import 'package:flutter_ismt_weather_application/services/ismt_weather_app_current_weather_api_service.dart';
import 'package:flutter_ismt_weather_application/widgets/ismt_weather_app_additional_information.dart';
import 'package:flutter_ismt_weather_application/widgets/ismt_weather_app_moment_weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MomentWeatherApiService momentWeatherApiService = MomentWeatherApiService();
  MomentWeather? dataMomentWeather;

  Future<void> getMomentWeatherData() async {
    dataMomentWeather =
        await momentWeatherApiService.getMomentWeather('Ankara');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9f9f9f),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf9f9f9),
        elevation: 0.0,
        title: const Text(
          'iSTM Weathering',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getMomentWeatherData(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                momentWeather(
                  Icons.wb_sunny_rounded,
                  '${dataMomentWeather!.temp}°',
                  '${dataMomentWeather!.cityname}',
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Additional Information',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                additionalInformation(
                    '${dataMomentWeather!.wind}',
                    '${dataMomentWeather!.humidity}',
                    '${dataMomentWeather!.pressure}',
                    '${dataMomentWeather!.clouds}'),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              child: Center(child: Text('Error Loading Data')),
            );
          }
        }),
      ),
    );
  }
}
