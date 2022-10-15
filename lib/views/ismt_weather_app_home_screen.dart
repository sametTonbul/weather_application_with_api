import 'package:flutter/material.dart';
import 'package:flutter_ismt_weather_application/widgets/ismt_weather_app_moment_weather.dart';
import '../models/ismt_weather_app_moment_weather_model.dart';
import '../services/ismt_weather_app_current_weather_api_service.dart';
import '../widgets/ismt_weather_app_additional_information.dart';
import 'ismt_weather_app_profile_screen.dart';

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
          'iSMT Weathering',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
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
                  Icons.wb_sunny_outlined,
                  '${dataMomentWeather!.temp}°',
                  '${dataMomentWeather!.name}',
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
                const Divider(),
                const SizedBox(
                  height: 20.0,
                ),
                additionalInformation(
                    '${dataMomentWeather!.wind}',
                    '${dataMomentWeather!.pressure}',
                    '${dataMomentWeather!.coordLatitude}',
                    '${dataMomentWeather!.coordLongitude}',
                    '${dataMomentWeather!.visibility}',
                    '${dataMomentWeather!.temp_min}',
                    '${dataMomentWeather!.temp_max}',
                    '${dataMomentWeather!.humidity}'),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              child: const Center(child: Text('Error Loading Data')),
            );
          }
        }),
      ),
    );
  }
}
