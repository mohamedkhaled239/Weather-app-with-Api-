
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getweathercibut/getweathercubitstates.dart';
import 'package:weather_app/weathermodel.dart';
import 'package:weather_app/weatherservice.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit():super(WeatherInitialState());
   WeatherModel? weatherModel;
  
  getWeather({required String cityname} )async{
    try {
   weatherModel= (await WeatherService(Dio()).getCurrentWeather(cityname: cityname))!;
  emit(WeatherLoadedState(weatherModel!));
} catch (e) {
    emit(WeatherFailurState( e.toString(),)
    );
  }
      
  }
  




}