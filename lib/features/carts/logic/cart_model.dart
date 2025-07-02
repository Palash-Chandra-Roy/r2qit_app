// models/fruit.dart
class Fruit {
  final String name;
  final String image;
  final double price;

  int quantity;

  Fruit({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}
