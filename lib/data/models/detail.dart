class Details {
  String name;
  dynamic price;
  String status;
  String detail;

  Details({this.name, this.price, this.status, this.detail});

  Details.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    status = json['status'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['status'] = this.status;
    data['detail'] = this.detail;
    return data;
  }
}
