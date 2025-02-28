class CategoryModel {
  final int id;
  final String name;
  final String imageurl;
  CategoryModel({required this.id, required this.name, required this.imageurl});

  factory CategoryModel.fromjson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'], name: json['category'], imageurl: json['imageurl']);
  }
}
