//parsing

class CategoryModel {
  bool? status;
  CategoryDataModel? data;

  CategoryModel.forjson(Map<String?, dynamic> category) {
    status = category['status'];
    data = CategoryDataModel.forjson(category['data']);
  }
  //Category_Model.forJson(  this.Status , this.data  );
}

class CategoryDataModel {
  int? currentpage;
  List<CategoryModelData>? data2 = []; // عباره عن لسته من المابات

  CategoryDataModel.forjson(Map<String, dynamic> json) {
    currentpage = json['current_page'];

    json['data'].forEach((elemint) {
      data2!.add(CategoryModelData.forJson(elemint));
    });
/*    json['data'].forEach((elemint) {
      this.data2!.add(Category_MData.forJson(json['data'])) ;

    });*/
  }
}

class CategoryModelData {
  int? id;
  String? name;
  String? image;
  CategoryModelData.forJson(Map<String, dynamic> json) {
    //عباره عن مابات
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
