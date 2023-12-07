import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getweathercibut/getweathercubit.dart';
import 'package:weather_app/cubit/getweathercibut/getweathercubitstates.dart';
import 'package:weather_app/noweatherbody.dart';
import 'package:weather_app/weatherinfobody.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     
       body:BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if(state is WeatherInitialState){
          return  const NoBodyWeather();
        }
        else if (state is WeatherLoadedState){
          return  WeatherInfoBody(
            weathermodel: state.weatherModel,
          );
        }else{
          
        return const NoBodyWeather();
        
        }
      },
       ),

 );
  }
}
