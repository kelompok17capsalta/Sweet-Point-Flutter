class DataPulsaa {
  String? timestamp;
  String? message;
  List<Data>? data;

  DataPulsaa({this.timestamp, this.message, this.data});

  DataPulsaa.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? productName;
  int? denom;
  String? category;
  String? descriptions;
  int? points;
  int? stock;
  String? image;

  Data(
      {this.id,
      this.productName,
      this.denom,
      this.category,
      this.descriptions,
      this.points,
      this.stock,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    denom = json['denom'];
    category = json['category'];
    descriptions = json['descriptions'];
    points = json['points'];
    stock = json['stock'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_name'] = productName;
    data['denom'] = denom;
    data['category'] = category;
    data['descriptions'] = descriptions;
    data['points'] = points;
    data['stock'] = stock;
    data['image'] = image;
    return data;
  }
}
