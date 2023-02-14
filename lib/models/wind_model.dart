class WindModel {
  double? speed;
  int? deg;
  double? gust;

  WindModel({this.speed, this.deg, this.gust});

  WindModel.fromJson(Map<String, dynamic> json) {
    speed = json['speed'].toDouble();
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['speed'] = speed;
    json['deg'] = deg;
    json['gust'] = gust;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
