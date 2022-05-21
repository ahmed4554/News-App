class ShopAppModel {
  bool? status;
  String message = '';
  ShopAppModelData? data;
  ShopAppModel.init({required Map<String, dynamic> map}) {
    status = map['status'];
    message = map['message'];
    data = map['data'] != null ?ShopAppModelData.init(map: map['data']) : null;
  }
}

class ShopAppModelData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;
  ShopAppModelData.init({required Map<String, dynamic> map}) {
    id = map['id'];
    name = map['name'];
    phone = map['phone'];
    email = map['email'];
    image = map['image'];
    token = map['token'];
  }
}
