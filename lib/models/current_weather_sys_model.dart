class CurrentWeatherSysModel {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  CurrentWeatherSysModel(
      {this.type, this.id, this.country, this.sunrise, this.sunset});

  CurrentWeatherSysModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['type'] = type;
    json['id'] = id;
    json['country'] = country;
    json['sunrise'] = sunrise;
    json['sunset'] = sunset;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
