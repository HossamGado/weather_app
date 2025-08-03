import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/theme/theme_data.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(
      context,
    ).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.weatherState),
            getThemeColor(weatherModel.weatherState)[300]!,
            getThemeColor(weatherModel.weatherState)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network("https:${weatherModel.image!}"),
                Text(
                  weatherModel.temp.round().toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Column(
                  children: [
                    Text(
                      'MaxTemp: ${weatherModel.maxTemp.round()}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'MinTemp: ${weatherModel.minTemp.round()}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              weatherModel.weatherState,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
