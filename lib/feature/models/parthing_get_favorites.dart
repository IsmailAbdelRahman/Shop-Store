//parsing

class FavoritesModel {
  bool? status;
  FavoritesDataModel? data;

  FavoritesModel.forjson(Map<String?, dynamic> favorites) {
    status = favorites['status'];
    data = FavoritesDataModel.forjson(favorites['data']);
  }
}

class FavoritesDataModel {
  int? currentPage;
  List<FavoritesModelData>? data2 = []; // عباره عن لسته من المابات

  FavoritesDataModel.forjson(Map<String, dynamic> json) {
    currentPage = json['current_page'];

    json['data'].forEach((elemint) {
      data2!.add(FavoritesModelData.forJson(elemint));
    });
  }
}

class FavoritesModelData {
  int? id;

  ProductMData? product;
  FavoritesModelData.forJson(Map<String, dynamic> json) {
    //عباره عن مابات
    id = json['id'];

    product = ProductMData.forjson(json['product']);
  }
}

class ProductMData {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  ProductMData.forjson(Map<String, dynamic> json) {
    id = json["id"];
    price = json["price"];
    oldPrice = json["old_price"];
    discount = json["discount"];
    image = json["image"];
    name = json["name"];
    description = json["description"];
  }
}
