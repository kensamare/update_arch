class CurentWeatherInfoModel {
  int? id;
  String? main;
  String? description;
  String? icon;

  CurentWeatherInfoModel({this.id, this.main, this.description, this.icon});

  CurentWeatherInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['id'] = id;
    json['main'] = main;
    json['description'] = description;
    json['icon'] = icon;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
