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
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
