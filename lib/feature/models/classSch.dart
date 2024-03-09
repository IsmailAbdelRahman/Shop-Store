import 'dart:ui';

class ShopLoginModel {
  bool? status;
  String? message;
  USerData? data;

  ShopLoginModel.formJson({required Map<String, dynamic> josn}) {
// بفرغ ماب وبسند كل محتوه فيها وحده لل صفات ال فوق
    status = josn['status'];
    message = josn['message'];
    data = josn['data'] != null
        ? USerData.formJosn(josn['data'])
        : null; // دي برضو عباره عن ماب عاوز افرغها واسندها لصفات بالتالي اعملها كلاس وحدها
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
  List<bannerMod>? Listbanners = [];
  List<productMod>? Listproducts = [];
  DataUser.ofJson(Map<String, dynamic> mapdata) {
    mapdata['banners'].forEach((elemint) {
      Listbanners!.add(bannerMod.ofJson(elemint));
    });
    /////
    mapdata['products'].forEach((elemint) {
      Listproducts!.add(productMod.ofJson(elemint));
    });
  }
}

/////////////////

class bannerMod {
  int? id;
  String? image;

  bannerMod.ofJson(Map<String, dynamic> data) {
    id = data['id'];
    image = data['image'];
  }
}

class productMod {
  int? id;
  dynamic price;
  dynamic oldprice;
  dynamic discount;
  String? name;
  String? Image;
  bool? in_cart;
  bool? in_favorites;

  productMod.ofJson(Map<String, dynamic> data) {
    id = data['id'];
    price = data['price'];
    oldprice = data['old_price'];
    discount = data['discount'];
    name = data['name'];
    Image = data['image'];
    in_favorites = data['in_favorites'];
    in_cart = data['in_cart'];
  }
}
