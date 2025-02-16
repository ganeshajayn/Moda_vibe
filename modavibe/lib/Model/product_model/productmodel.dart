class Productfromapi {
  final String productname;
  final String categoryname;
  final String size;
  final double price;
  final int stock;
  final int id;
  final List<String> image;
  Productfromapi(
      {required this.productname,
      required this.categoryname,
      required this.size,
      required this.price,
      required this.stock,
      required this.image,
      required this.id});
  factory Productfromapi.fromjson(Map<String, dynamic> json) => Productfromapi(
      id: json["id"] as int,
      productname: json['productname'],
      categoryname: json['categoryname'],
      size: json['size'] as String,
      stock: json['stock'] as int,
      price: json["price"] as double,
      image: List<String>.from(json["image"]));
}
