import 'dart:convert';

import 'package:flutter_ismt_weather_application/models/ismt_weather_app_moment_weather_model.dart';
import 'package:http/http.dart' as http;

class MomentWeatherApiService {
  Future<MomentWeather>? getMomentWeather(String? location) async {
    var apiUrl = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=3469be16a3db8390c0f5846c32dd35ed&units=metric');
    var response = await http.get(apiUrl);
    var body = jsonDecode(response.body);
    print(MomentWeather.fromJson(body).cityname); // debug
    return MomentWeather.fromJson(body);
  }
}
