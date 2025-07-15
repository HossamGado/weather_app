import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text(
          "Search City",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (value) async {
              WeatherModel weatherModel = await WeatherServices(
                Dio(),
              ).getCurrenWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              labelText: "Search",
              hintText: "Enter City Name",
              contentPadding: EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 16,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
WeatherModel?weatherModel;
