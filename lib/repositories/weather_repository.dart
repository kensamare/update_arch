import 'package:eticon_api/eticon_api.dart';
import 'package:update_arch/models/current_weather_model.dart';
import 'package:update_arch/models/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel> forecast() async {
    Map<String, dynamic> query = {
      "lat": 56.49771,
      "lon": 84.97437,
      "appId": "d3e49a70f2c9bd5acb92ca170826d6ad",
      "units": "metric"
    };

    return await Api.get(
      'forecast',
      query: query,
      testMode: true,
      fromJson: WeatherModel.fromJson,
    );
  }

  Future<CurrentWeatherModel> getCurrentWeather()async{
    Map<String, dynamic> query = {
      "lat": 56.49771,
      "lon": 84.97437,
      "appId": "d3e49a70f2c9bd5acb92ca170826d6ad",
      "units": "metric"
    };

    return await Api.get(
      'weather',
      query: query,
      testMode: true,
      fromJson: CurrentWeatherModel.fromJson,
    );
  }
}
