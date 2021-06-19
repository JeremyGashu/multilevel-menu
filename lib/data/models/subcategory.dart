import 'detail.dart';

class Subcategories {
  String name;
  Details details;
  List<Subcategories> subcategories;

  Subcategories({this.name, this.details, this.subcategories});

  Subcategories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories.add(new Subcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    if (this.subcategories != null) {
      data['subcategories'] =
          this.subcategories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
