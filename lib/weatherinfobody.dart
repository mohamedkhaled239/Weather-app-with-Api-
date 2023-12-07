
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/cubit/getweathercibut/getweathercubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/searchveiw.dart';
import 'package:weather_app/weathermodel.dart';
class WeatherInfoBody extends StatelessWidget {
   const WeatherInfoBody({super.key, required WeatherModel weathermodel,});
  
  @override
  Widget build(BuildContext context) {
    
   WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      appBar: AppBar(title: const Text('search a City'),

        actions: [
          IconButton(onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SearchView()),
  );
}, icon: const Icon(Icons.search)),
        ],),
      body: Container(
        decoration:   BoxDecoration(
          gradient: LinearGradient(
            colors: [
              getThemeColor(weatherModel.weatherCondition)[300]!,
              getThemeColor(weatherModel.weatherCondition)[200]!,
              getThemeColor(weatherModel.weatherCondition)[50]!,

            ],
            begin: Alignment.topCenter,
            end:  Alignment.bottomCenter
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              weatherModel.cityname,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
             Text(
              "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
      
                  /*Image.network(width:100,height:100,
                 "https:${weatherModel!.image!}",
                    ), */
                    
                Lottie.asset(
                 image[num],width: 130,height: 140,
                    ),  
      
      
                
                 Text(
                  weatherModel.temp.toString(),
                   style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                 Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel.maxtemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                   'Mintemp: ${weatherModel.mintemp.round()}',
      
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
             Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 int num=0;
    void setnum(int n){
      num=n;
      }