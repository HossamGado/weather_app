import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "09ea455a4cbf4cd9991160814253107";

  WeatherServices(this.dio);

  Future<WeatherModel> getCurrenWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1",
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "Oops there was an error, try later ";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Oops there was an error ,try later");
    }
  }
}
