import 'coord_model.dart';

class CityModel {
  int? id;
  String? name;
  CoordModel? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  CityModel(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone,
      this.sunrise,
      this.sunset});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? CoordModel?.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    if (coord != null) {
      json['coord'] = coord!.toJson();
    }
    json['country'] = country;
    json['population'] = population;
    json['timezone'] = timezone;
    json['sunrise'] = sunrise;
    json['sunset'] = sunset;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
