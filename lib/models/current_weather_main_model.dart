class CurrentWeatherMainModel {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  CurrentWeatherMainModel(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  CurrentWeatherMainModel.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['temp'] = temp;
    json['feels_like'] = feelsLike;
    json['temp_min'] = tempMin;
    json['temp_max'] = tempMax;
    json['pressure'] = pressure;
    json['humidity'] = humidity;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
