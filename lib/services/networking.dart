import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {
  String latitude;
  String longitude;
  String apiKey;

  NetworkHelper({this.latitude, this.longitude, @required this.apiKey});

  Future getDataByLocation(String cityName) async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': cityName,
      'appid': apiKey,
      'units': 'metric',
    });
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    } else
      return response.statusCode;
  }

  Future getDataByCoordinates() async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude,
      'lon': longitude,
      'appid': apiKey,
      'units': 'metric',
    });
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    } else
      return response.statusCode;
  }
}
