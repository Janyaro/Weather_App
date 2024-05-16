import 'dart:convert';
import 'package:http/http.dart';

class Working {
  late String location;
  String? temp;
  String? humidity;
  String? airSpeed;
  String? description;
  String? main;
  String? iconWeather;

  Working(this.location) {
    location = this.location;
  }

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=7fa6f4066e57bea247ac878ae38ddb78'));

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        Map tempData = data['main'];
        String getHumidity = tempData['humidity'].toString();
        Map wind = data['wind'];
        double windSpeed = wind['speed'];
        double getTemp = tempData['temp'] - 273;
        List weatherData = data['weather'];
        Map weatherMainData = weatherData[0];
        String weatherMain = weatherMainData['main'];
        String weatherDescription = weatherMainData['description'];
        String weatherIcon = weatherMainData['icon'].toString();

        // Assign values to the fields
        temp = getTemp.toStringAsFixed(1);
        humidity = getHumidity;
        airSpeed = windSpeed.toString();
        description = weatherDescription;
        main = weatherMain;
        iconWeather = weatherIcon;
        print(temp);
        print(humidity);
        print(airSpeed);
        print(description);
        print(main);
        print(iconWeather);
      } else {
        print('Error: ${response.statusCode}');
        _setDefaultValues();
      }
    } catch (e) {
      print('Exception caught: $e');
      _setDefaultValues();
    }
  }

  void _setDefaultValues() {
    temp = 'N/A';
    humidity = 'N/A';
    airSpeed = 'N/A';
    description = 'N/A';
    main = 'N/A';
    iconWeather = 'N/A';
  }
}
