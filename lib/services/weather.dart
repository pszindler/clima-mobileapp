import 'package:clima/services/networking.dart';
import '../services/location.dart';

const String apiKey = '8b028215eb0e743981e3c5d4f1e155e9';

class WeatherModel {
  Future<dynamic> getWeatherDataByCity(String cityName) async {
    NetworkHelper nethelp = NetworkHelper(apiKey: apiKey);
    var weatherData = await nethelp.getDataByLocation(cityName);
    return weatherData;
  }

  Future<dynamic> getWeatherDataByLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper nethelp = NetworkHelper(
        latitude: location.latitude.toString(),
        longitude: location.longitude.toString(),
        apiKey: apiKey);
    var weatherData = await nethelp.getDataByCoordinates();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
