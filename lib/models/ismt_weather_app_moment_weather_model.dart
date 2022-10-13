class MomentWeather {
  String? cityname;
  num? temp;
  num? wind;
  num? humidity;
  num? clouds;
  num? pressure;

  MomentWeather(this.cityname, this.temp, this.wind, this.humidity, this.clouds,
      this.pressure);

  factory MomentWeather.fromJson(Map<String, dynamic> json) {
    return MomentWeather(
      json['name'],
      json['main']['temp'],
      json['wind']['speed'],
      json['main']['pressure'],
      json['main']['humidity'],
      json['clouds']['all'],
    );
  }
}
