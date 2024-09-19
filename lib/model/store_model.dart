class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  double rate;
  int count;

  ProductModel({
    required this.id,
    required this.category,
    required this.count,
    required this.description,
    required this.image,
    required this.price,
    required this.rate,
    required this.title,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      category: json['category'],
      count: json['rating']['count'],
      description: json['description'],
      image: json['image'],
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : json['price'],
      rate: (json['rating']['rate'] is int)
          ? (json['rating']['rate'] as int).toDouble()
          : json['rating']['rate'],
      title: json['title'],
    );
  }
}
