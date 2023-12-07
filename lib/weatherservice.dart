
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/searchveiw.dart';
import 'package:weather_app/weathermodel.dart';
import 'package:dio/dio.dart';

class WeatherService{
  final String baseUrl='http://api.weatherapi.com/v1';
  final String apikey = '67177e6f7e4c4136bca140345232710';
  final Dio dio ;
WeatherService(this.dio);

  Future<WeatherModel?> getCurrentWeather({required String cityname})async{

      try {
  Response response =await dio.get("$baseUrl/forecast.json?key=$apikey&q=$cityname&days=1");
    
    
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
}  on DioException catch (e) {
  final String errormasseage = e.response?.data['error']['message']?? 'oops there was an error ,try later';
        throw Exception(errormasseage);
    }catch(e){
      log(e.toString());
      

        throw Exception('oops there was an error ,try later');
      
    } 


  }

}