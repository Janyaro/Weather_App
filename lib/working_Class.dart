import 'dart:convert';
import 'package:http/http.dart';

class working {
  String location;
  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;

  working(this.location) {
    location = this.location;
  }

  Future<void> getData() async {
    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=7fa6f4066e57bea247ac878ae38ddb78'));
    Map data = jsonDecode(response.body);

    Map temp_data = data['main'];
    String gethumidity = temp_data['humidity'].toString();
    Map wind = data['wind'];
    double wind_Speed = wind['speed'];

    double get_temp = temp_data['temp'];

    //getting description
    List weather_data = data['weather'];
    Map weather_main_data = weather_data[0];
    String weather_main = weather_main_data['main'];
    String Weather_description = weather_main_data['description'];

// Assign value to  the parameter
    temp = get_temp.toString();
    humidity = gethumidity;
    air_speed = wind_Speed.toString();
    description = Weather_description;
    main = weather_main;
  }
}
