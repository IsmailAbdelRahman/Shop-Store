//parsing

class CategoryModel {
  bool? Status;
  CategoryData_Model? data;

  CategoryModel.forjson(Map<String?, dynamic> Category) {
    this.Status = Category['status'];
    this.data = CategoryData_Model.forjson(Category['data']);
  }
  //Category_Model.forJson(  this.Status , this.data  );
}

class CategoryData_Model {
  int? current_page;
  List<CategoryModelData>? data2 = []; // عباره عن لسته من المابات

  CategoryData_Model.forjson(Map<String, dynamic> json) {
    this.current_page = json['current_page'];

    json['data'].forEach((elemint) {
      this.data2!.add(CategoryModelData.forJson(elemint));
    });
/*    json['data'].forEach((elemint) {
      this.data2!.add(Category_MData.forJson(json['data'])) ;

    });*/
  }
}

class CategoryModelData {
  int? id;
  String? name;
  String? Image;
  CategoryModelData.forJson(Map<String, dynamic> json) {
    //عباره عن مابات
    id = json['id'];
    name = json['name'];
    Image = json['image'];
  }
}
