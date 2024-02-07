import 'dart:convert';
import 'package:weather/data/models/weather_api_response.dart';
import 'package:http/http.dart' as http;
class WeatherAPI {
 Future<WeatherApiResponse> getAPIData(String city) async {
   final http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=856505681f70c487dba416299e63d283'));
   if (response.statusCode <= 299 && response.statusCode >= 200) {
     final Map<String, dynamic> jsonBody = jsonDecode(response.body);
     WeatherApiResponse weatherApiResponse = WeatherApiResponse.fromMap(jsonBody);
     return weatherApiResponse;
   }
   else {
     throw ('ResponseFailure ${response.body}');
   }
 }
}