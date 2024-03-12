class ShopLoginModel {
  bool? status;
  String? message;
  USerData? data;

  ShopLoginModel.formJson({required Map<String, dynamic> josn}) {
    status = josn['status'];
    message = josn['message'];
    data = josn['data'] != null ? USerData.formJosn(josn['data']) : null;
  }
}

class USerData {
  int? id;
  String? name;
  String? email;
  String? phone; //
  String? image;
  int? points;
  int? credit;
  String? token;

  USerData.formJosn(Map<String, dynamic> josn) {
    id = josn['id'];
    name = josn['name'];
    email = josn['email'];
    phone = josn['phone'];
    image = josn['image'];
    points = josn['points'];
    credit = josn['credit'];
    token = josn['token'];
  }
}
///////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////
class HomeUser {
  bool? status;
  DataUser? data;

  HomeUser.ofJson(Map<String, dynamic> mapHomeUser) {
    status = mapHomeUser["status"];
    data = DataUser.ofJson(mapHomeUser['data']);
  }
}

class DataUser {
  List<BannerMod>? listbanners = [];
  List<ProductMod>? listproducts = [];
  DataUser.ofJson(Map<String, dynamic> mapdata) {
    mapdata['banners'].forEach((elemint) {
      listbanners!.add(BannerMod.ofJson(elemint));
    });
    /////
    mapdata['products'].forEach((elemint) {
      listproducts!.add(ProductMod.ofJson(elemint));
    });
  }
}

/////////////////

class BannerMod {
  int? id;
  String? image;

  BannerMod.ofJson(Map<String, dynamic> data) {
    id = data['id'];
    image = data['image'];
  }
}

class ProductMod {
  int? id;
  dynamic price;
  dynamic oldprice;
  dynamic discount;
  String? name;
  String? image;
  bool? incart;
  bool? infavorites;

  ProductMod.ofJson(Map<String, dynamic> data) {
    id = data['id'];
    price = data['price'];
    oldprice = data['old_price'];
    discount = data['discount'];
    name = data['name'];
    image = data['image'];
    infavorites = data['in_favorites'];
    incart = data['in_cart'];
  }
}
