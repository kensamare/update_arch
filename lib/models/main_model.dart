class MainModel {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  MainModel(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.seaLevel,
      this.grndLevel,
      this.humidity,
      this.tempKf});

  MainModel.fromJson(Map<String, dynamic> json) {
    temp = json['temp'].toDouble();
    feelsLike = json['feels_like'].toDouble();
    tempMin = json['temp_min'].toDouble();
    tempMax = json['temp_max'].toDouble();
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['temp'] = temp;
    json['feels_like'] = feelsLike;
    json['temp_min'] = tempMin;
    json['temp_max'] = tempMax;
    json['pressure'] = pressure;
    json['sea_level'] = seaLevel;
    json['grnd_level'] = grndLevel;
    json['humidity'] = humidity;
    json['temp_kf'] = tempKf;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
