class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });

  // Convert JSON → Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
    );
  }

  // Convert Product → JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "description": description,
      "image": image,
    };
  }
}