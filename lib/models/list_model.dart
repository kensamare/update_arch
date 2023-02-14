import 'main_model.dart';
import 'weather_model.dart';
import 'clouds_model.dart';
import 'wind_model.dart';
import 'sys_model.dart';

class ListModel {
  int? dt;
  MainModel? main;
  List<WeatherModel> weather = [];
  CloudsModel? clouds;
  WindModel? wind;
  int? visibility;
  int? pop;
  SysModel? sys;
  String? dtTxt;

  ListModel(
      {this.dt,
      this.main,
      this.weather = const [],
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.sys,
      this.dtTxt});

  ListModel.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? MainModel?.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather.add(WeatherModel.fromJson(v));
      });
    }
    clouds =
        json['clouds'] != null ? CloudsModel?.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? WindModel?.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = json['sys'] != null ? SysModel?.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['dt'] = dt;
    if (main != null) {
      json['main'] = main!.toJson();
    }
    if (weather != null) {
      json['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      json['clouds'] = clouds!.toJson();
    }
    if (wind != null) {
      json['wind'] = wind!.toJson();
    }
    json['visibility'] = visibility;
    json['pop'] = pop;
    if (sys != null) {
      json['sys'] = sys!.toJson();
    }
    json['dt_txt'] = dtTxt;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
