import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getweathercibut/getweathercubit.dart';
import 'package:weather_app/cubit/getweathercibut/getweathercubitstates.dart';
import 'package:weather_app/homeview.dart';
import 'package:weather_app/weatherinfobody.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const CustemMaterialApp(),
    );
  }
}

class CustemMaterialApp extends StatelessWidget {
  const CustemMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: getThemeColor(
              BlocProvider.of<GetWeatherCubit>(context)
                  .weatherModel
                  ?.weatherCondition,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const HomeView(),
        );
      },
    );
  }
}

MaterialColor getThemeColor(String? condition,) {
  if (condition == null) {
    return Colors.blue;
  }

  switch (condition) {
    case 'Sunny':
      setnum(0);
      return Colors.orange;
      
    case 'Partly cloudy':
   setnum(1);
      return Colors.yellow;
    case 'Cloudy': // Cloudy
    setnum(1);
      return Colors.grey;
      
    case 'Overcast': // Overcast
        setnum(3);

      return Colors.blueGrey;
    case 'Mist': // Mist
      return Colors.cyan;
    case 'Patchy rain possible'||'Patchy snow possible'||'Patchy sleet possible'||' Patchy freezing drizzle possible': // Patchy rain possible
        setnum(1);
      return Colors.deepPurple;
    case 'Thundery outbreaks possible': 
            setnum(6);

      return Colors.amber;
    case 'Blowing snow': // Blowing snow
    case 'Blizzard': // Blizzard
            setnum(2);

      return Colors.indigo;
    case 'Fog': // Fog
    case ' Freezing fog': // Freezing fog
                setnum(4);

      return Colors.teal;
    case 'Patchy light drizzle': // Patchy light drizzle
    case 'Light drizzle': // Light drizzle
    case 'Freezing drizzle': // Freezing drizzle
    case 'Heavy freezing drizzle': 
        setnum(5);

      return Colors.deepOrange;
    case ' Patchy light rain': // Patchy light rain
    case 'Light rain': // Light rain
    case 'Moderate rain at time': // Moderate rain at times
    case 'Moderate rain': // Moderate rain
    case 'Heavy rain at times': // Heavy rain at times
    case 'Heavy rain': // Heavy rain
    case 'Light freezing rain': // Light freezing rain
    case 'Moderate or heavy freezing rain': // Moderate or heavy freezing rain
    setnum(5);
      return Colors.blue;
    case 'Light sleet'||'Moderate'||'heavy sleet': // Light sleet
            setnum(5);

      return Colors.pink;
    case 'Patchy light snow':
    case 'Light snow':
    case ' Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case ' Heavy snow':
        setnum(2);
      return Colors.lightBlue;
    case 'Ice pellets':
    setnum(2);
      return Colors.indigo;
    case 'Light rain shower':
    case 'heavy rain shower':
    case 'Torrential rain shower': // Torrential rain shower
    setnum(2);
      return Colors.green;
    case 'Light sleet showers': // Light sleet showers
    case 'heavy sleet showers': // Moderate or heavy sleet showers
        setnum(2);

      return Colors.purple;
    case 'Light snow showers': // Light snow showers
    case 'heavy snow showers': // Moderate or heavy snow showers
      return Colors.cyan;
    case 'Light showers of ice pellets': // Light showers of ice pellets
    case 'Moderate or heavy showers of ice pellets': // Moderate or heavy showers of ice pellets
      return Colors.lightGreen;
    case 'Patchy light rain with thunder': // Patchy light rain with thunder
    case 'Moderate or heavy rain with thunder': // Moderate or heavy rain with thunder
    case 'Patchy light snow with thunder': // Patchy light snow with thunder
    case 'Moderate or heavy snow with thunder': // Moderate or heavy snow with thunder
        setnum(5);

      return Colors.red;
    default:
    setnum(5);
      return Colors.grey;
      
  }
}
