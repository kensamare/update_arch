class SysModel {
  String? pod;

  SysModel({this.pod});

  SysModel.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['pod'] = pod;
    return json;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
