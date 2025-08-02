class WeatherModel {
  final DateTime date;
  final String cityName;
  final double minTemp;
  final double maxTemp;
  final double temp;
  final String weatherState;
  final String? image;

  const WeatherModel({
    required this.date,
    required this.cityName,
    required this.minTemp,
    required this.maxTemp,
    required this.temp,
    required this.weatherState,
    this.image,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      date: DateTime.parse(json["current"]["last_updated"]),
      cityName: json["location"]["name"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      weatherState:
          json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
    );
  }
}
