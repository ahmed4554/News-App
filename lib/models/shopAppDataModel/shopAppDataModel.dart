class ProductsDataModel {
  bool? status;
  InnerDataModel? data;
  ProductsDataModel.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    data = InnerDataModel.fromJson(json['data']);
  }
}

class InnerDataModel {
  List<Banners> banners = [];
  List<Products> products = [];
  InnerDataModel.fromJson(Map<String,dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(Banners.fromJson(element));
    });
    json['products'].forEach((element) {
      products.add(Products.fromJson(element));
    });
  }
}

class Banners {
  int? id;
  String? image;
  Banners.fromJson(Map<String,dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class Products {
  int? id;
  dynamic price;
  dynamic old_price;
  int? discount;
  String? image;
  String? name;
  bool? in_favorites;
  bool? in_cart;
  Products.fromJson(Map<String,dynamic> json) {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
  }
}
