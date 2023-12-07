
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/getweathercibut/getweathercubit.dart';
import 'package:weather_app/weathermodel.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a city"),
      ),

      body:   Padding(
        padding: const EdgeInsets.symmetric(horizontal:25),
        child: Center(
          child:  TextField(
            onSubmitted: ( value) async {
              
              var getweathercibut = BlocProvider.of<GetWeatherCubit>(context);
              getweathercibut.getWeather(cityname: value);
              Navigator.pop(context);   
                         
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
             hintText: "Enter City Name",
             hintStyle: TextStyle(fontSize: 15,color: Colors.grey),
              
              border :  OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;