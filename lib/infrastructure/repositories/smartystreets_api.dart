import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather/infrastructure/model/weather.dart';
import 'dart:convert';

abstract class WeatherRepository {
  Future<Weather> fetchZipCode(String zipCode);
}

class WeatherAPI implements WeatherRepository {
  @override
  Future<Weather> fetchZipCode(String zipCode) async {
    Weather result;
    String id = env['smartyStreetsAuthID'];
    String token = env['smartyStreetsAuthToken'];
    try {
      final response = await http.get(
          'https://smartystreets.com/products/apis/us-zipcode-api?auth-id=$id&auth-token=$token&city=&state=&zipcode=$zipCode&method=get');
      if (response.statusCode == 200) {
        final dataSet = json.decode(response.body);
        result = Weather.fromJson(dataSet);
      }
    } catch (e) {}
    return result;
  }
}
