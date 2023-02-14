class CoordModel {
  double? lat;
  double? lon;

  CoordModel({this.lat, this.lon});

  CoordModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['lat'] = lat;
    json['lon'] = lon;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
