class CartItem {
  final int id;
  final String name;
  final double price;
  final String image;
  final String description;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;
}
