class CloudsModel {
  int? all;

  CloudsModel({this.all});

  CloudsModel.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['all'] = all;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
