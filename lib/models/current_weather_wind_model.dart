class CurrentWeatherWindModel {
  int? speed;
  int? deg;

  CurrentWeatherWindModel({this.speed, this.deg});

  CurrentWeatherWindModel.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['speed'] = speed;
    json['deg'] = deg;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
