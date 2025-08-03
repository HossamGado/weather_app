import 'package:flutter/material.dart';

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
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