import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(
                      context,
                    ).weatherModel?.weatherState,
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case "sunny":
      return Colors.amber;
    case "partly cloudy":
      return Colors.blueGrey;
    case "cloudy":
      return Colors.grey;
    case "overcast":
      return Colors.blue;
    case "mist":
    case "fog":
    case "freezing fog":
      return Colors.lightBlue;
    case "patchy rain possible":
    case "light rain":
    case "snow":
    case "light snow":
      return Colors.lightGreen;
    case "heavy rain":
    case "thundery outbreaks possible":
    case "blizzard":
      return Colors.red;
    case "light sleet":
      return Colors.orange;
    case "ice pellets":
      return Colors.cyan;
    default:
      return Colors.blue;
  }
}
