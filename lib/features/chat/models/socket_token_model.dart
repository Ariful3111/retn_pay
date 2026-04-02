class SocketTokenModel {
  String? auth;

  SocketTokenModel({this.auth});

  SocketTokenModel.fromJson(Map<String, dynamic> json) {
    auth = json['auth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['auth'] = auth;
    return data;
  }
}
