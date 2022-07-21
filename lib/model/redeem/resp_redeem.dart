class RespRedeem {
  String? timestamp;
  String? message;
  Data? data;

  RespRedeem({this.timestamp, this.message, this.data});

  RespRedeem.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? created;
  String? descriptions;
  String? status;
  int? points;
  User? user;
  String? category;
  String? credentials;
  String? provider;
  int? denom;

  Data(
      {this.id,
      this.created,
      this.descriptions,
      this.status,
      this.points,
      this.user,
      this.category,
      this.credentials,
      this.provider,
      this.denom});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    descriptions = json['descriptions'];
    status = json['status'];
    points = json['points'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    category = json['category'];
    credentials = json['credentials'];
    provider = json['provider'];
    denom = json['denom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created'] = this.created;
    data['descriptions'] = this.descriptions;
    data['status'] = this.status;
    data['points'] = this.points;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['category'] = this.category;
    data['credentials'] = this.credentials;
    data['provider'] = this.provider;
    data['denom'] = this.denom;
    return data;
  }
}

class User {
  String? username;

  User({this.username});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    return data;
  }
}
