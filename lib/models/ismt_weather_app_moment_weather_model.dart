import 'package:flutter/widgets.dart';

class MomentWeather {
  String name;
  num temp;
  num? temp_min;
  num? temp_max;
  num wind;
  num humidity;
  num visibility;
  num pressure;
  num? coordLongitude;
  num? coordLatitude;
  //DateTime? sunrise;
  //DateTime? sunset;
  //String icon;
  //String? description;

  MomentWeather(
      this.name,
      this.temp,
      this.wind,
      this.humidity,
      this.visibility,
      this.pressure,
      this.coordLatitude,
      this.coordLongitude,
      // this.description,
      //this.icon);
      //this.sunrise,
      //this.sunset,
      this.temp_max,
      this.temp_min);

  factory MomentWeather.fromJson(Map<String, dynamic> json) {
    return MomentWeather(
      json['name'],
      json['main']['temp'],
      json['wind']['speed'],
      json['main']['humidity'],
      json['visibility'],
      json['main']['pressure'],
      json['coord']['lat'],
      json['coord']['lon'],
      // json['weather']['description'],
      // json['weather']['icon'],
      // json['sys']['sunrise'],
      // json['sys']['sunset'],
      json['main']['temp_max'],
      json['main']['temp_min'],
    );
  }
}
