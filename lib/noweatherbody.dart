import 'package:flutter/material.dart';
import 'package:weather_app/searchveiw.dart';

class NoBodyWeather extends StatelessWidget {
  const NoBodyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Weather App'),
        actions: [
          IconButton(onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SearchView()),
  );
}, icon: const Icon(Icons.search)),
        ],),
        body:const  Center(
        child : Center(child: Text('there is no weather 😔 start \n         Searching now🔍',style: TextStyle(fontSize: 25),)),
       
         
        ),
      );
  }
}