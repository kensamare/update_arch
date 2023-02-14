import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eticon_api/eticon_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:update_arch/models/current_weather_model.dart';
import 'package:update_arch/models/weather_model.dart';
import 'package:update_arch/project_utils/get_it.dart';
import 'package:update_arch/repositories/weather_repository.dart';

///1.2 Обновляем кубит и генерируем код

part 'st_main_screen.dart';

part 'cb_main_screen.freezed.dart';

// class CbMainScreen extends Cubit<StMainScreen> {
//   CbMainScreen() : super(StMainScreen.loading());
// }

//1.5 Обновляем
class CbMainScreen extends Cubit<StMainScreen> {
  final WeatherRepository _weather = getIt<WeatherRepository>();

  CbMainScreen() : super(const StMainScreen.loading()) {
    getFullWeather();
  }

  Future<void> getFullWeather() async {
    try {
      WeatherModel weatherModel = await _weather.forecast();
      CurrentWeatherModel currentWeather = await _weather.getCurrentWeather();
      emit(StMainScreen.loaded(weatherModel, currentWeather));
    } on APIException catch (e) {
      print(e);
      emit(StMainScreen.error(e.code, e.body));
    }
  }
}
