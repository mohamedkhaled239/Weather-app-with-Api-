// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app/weathermodel.dart';

class WeatherState{}

class WeatherInitialState extends WeatherState {

}


class WeatherLoadedState extends WeatherState {
final WeatherModel weatherModel;
  WeatherLoadedState(this.weatherModel);
}



class WeatherFailurState extends WeatherState {
  final String errmasseage;
  WeatherFailurState(
     this.errmasseage,
  );
}


