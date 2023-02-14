import 'coord_model.dart';
import 'curent_weather_info_model.dart';
import 'current_weather_main_model.dart';
import 'current_weather_wind_model.dart';
import 'clouds_model.dart';
import 'current_weather_sys_model.dart';

class CurrentWeatherModel {
  CoordModel? coord;
  List<CurentWeatherInfoModel> weather = [];
  String? base;
  CurrentWeatherMainModel? main;
  int? visibility;
  CurrentWeatherWindModel? wind;
  CloudsModel? clouds;
  int? dt;
  CurrentWeatherSysModel? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentWeatherModel(
      {this.coord,
      this.weather = const [],
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? CoordModel?.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather.add(CurentWeatherInfoModel.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null
        ? CurrentWeatherMainModel?.fromJson(json['main'])
        : null;
    visibility = json['visibility'];
    wind = json['wind'] != null
        ? CurrentWeatherWindModel?.fromJson(json['wind'])
        : null;
    clouds =
        json['clouds'] != null ? CloudsModel?.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null
        ? CurrentWeatherSysModel?.fromJson(json['sys'])
        : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (coord != null) {
      json['coord'] = coord!.toJson();
    }
    if (weather != null) {
      json['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    json['base'] = base;
    if (main != null) {
      json['main'] = main!.toJson();
    }
    json['visibility'] = visibility;
    if (wind != null) {
      json['wind'] = wind!.toJson();
    }
    if (clouds != null) {
      json['clouds'] = clouds!.toJson();
    }
    json['dt'] = dt;
    if (sys != null) {
      json['sys'] = sys!.toJson();
    }
    json['timezone'] = timezone;
    json['id'] = id;
    json['name'] = name;
    json['cod'] = cod;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
