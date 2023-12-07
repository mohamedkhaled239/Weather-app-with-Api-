class WeatherModel {
  final String cityname;
  final DateTime date;
  final String? image;
  final double temp;
  final double mintemp;
  final double maxtemp;
  final String weatherCondition;
  WeatherModel({
    required this.cityname,
    required this.date,
     this.image,
    required this.temp,
    required this.mintemp,
    required this.maxtemp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(json){

    return WeatherModel(
      image: setimg(2),
      cityname: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated'],),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],);
  }




}
List image=[
  "assets/images/sunny.json",
  "assets/images/cloudy.json",
  "assets/images/snow.json",
  "assets/images/overcast.json",
  "assets/images/windy.json",
  "assets/images/thunderstorm.json",
    "assets/images/rainy.json"

];
setimg(int num) {
return image[num];
}
