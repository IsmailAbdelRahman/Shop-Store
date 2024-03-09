//parsing

class FavoritesModel {
  bool? Status;
  FavoritesData_Model? data;

  FavoritesModel.forjson(Map<String?, dynamic> Favorites) {
    this.Status = Favorites['status'];
    this.data = FavoritesData_Model.forjson(Favorites['data']);
  }
}

class FavoritesData_Model {
  int? current_page;
  List<FavoritesModelData>? data2 = []; // عباره عن لسته من المابات

  FavoritesData_Model.forjson(Map<String, dynamic> json) {
    this.current_page = json['current_page'];

    json['data'].forEach((elemint) {
      this.data2!.add(FavoritesModelData.forJson(elemint));
    });
  }
}

class FavoritesModelData {
  int? id;

  product_MData? Product;
  FavoritesModelData.forJson(Map<String, dynamic> json) {
    //عباره عن مابات
    id = json['id'];

    Product = product_MData.forjson(json['product']);
  }
}

class product_MData {
  int? id;
  dynamic? price;
  dynamic? old_price;
  int? discount;
  String? Image;
  String? name;
  String? description;
  product_MData.forjson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.price = json["price"];
    this.old_price = json["old_price"];
    this.discount = json["discount"];
    this.Image = json["image"];
    this.name = json["name"];
    this.description = json["description"];
  }
}
