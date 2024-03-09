class ChangeFavoritesModels {
  bool? status;
  String? message;

  ChangeFavoritesModels(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
