import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/theme/theme_data.dart';
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
