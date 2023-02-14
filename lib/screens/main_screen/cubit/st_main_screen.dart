part of 'cb_main_screen.dart';

///1.2 Обновляем состояния

// @freezed
// abstract class StMainScreen with _$StMainScreen {
//   const factory StMainScreen.loading() = _Loading;
//   const factory StMainScreen.error(int? error, String? message) = _Error;
//   const factory StMainScreen.loaded() = _Loaded;
// }

@freezed
abstract class StMainScreen with _$StMainScreen {
  const factory StMainScreen.loading() = _Loading;
  const factory StMainScreen.error(int? error, String? message) = _Error;
  const factory StMainScreen.loaded(WeatherModel weather, CurrentWeatherModel currentWeather) = _Loaded;
}