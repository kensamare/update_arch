import 'list_model.dart';
import 'city_model.dart';

class WeatherModel {
  String? cod;
  int? message;
  int? cnt;
  List<ListModel> list = [];
  CityModel? city;

  WeatherModel({this.cod, this.message, this.cnt, this.list = const [], this.city});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list.add(ListModel.fromJson(v));
      });
    }
    city = json['city'] != null ? CityModel?.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['cod'] = cod;
    json['message'] = message;
    json['cnt'] = cnt;
    if (list != null) {
      json['list'] = list.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      json['city'] = city!.toJson();
    }
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
