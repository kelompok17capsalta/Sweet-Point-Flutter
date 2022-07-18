class DataRedeem {
  String? descriptions;
  int? points;
  User? user;
  String? category;
  String? credentials;
  String? provider;
  int? denom;
  int? product;

  DataRedeem(
      {this.descriptions,
      this.points,
      this.user,
      this.category,
      this.credentials,
      this.provider,
      this.denom,
      this.product});

  DataRedeem.fromJson(Map<String, dynamic> json) {
    descriptions = json['descriptions'];
    points = json['points'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    category = json['category'];
    credentials = json['credentials'];
    provider = json['provider'];
    denom = json['denom'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descriptions'] = this.descriptions;
    data['points'] = this.points;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['category'] = this.category;
    data['credentials'] = this.credentials;
    data['provider'] = this.provider;
    data['denom'] = this.denom;
    data['product'] = this.product;
    return data;
  }
}

class User {
  String? username;

  User(this.username);

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    return data;
  }
}
