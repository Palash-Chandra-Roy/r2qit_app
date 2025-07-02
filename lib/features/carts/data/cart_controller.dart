// controllers/cart_controller.dart
import 'package:get/get.dart';
import 'package:r2ait_app/features/carts/logic/cart_model.dart';

class CartController extends GetxController {
  var fruits = <Fruit>[
    Fruit(
      name: "Apple",
      image: "assets/images/apple.png",
      price: 250,
    ),
    Fruit(
      name: "Apple",
      image: "assets/images/apple.png",
      price: 200,
    ),
    Fruit(
      name: "Apple",
      image: "assets/images/apple.png",
      price: 300,
    ),
  ].obs;

  void increaseQty(int index) {
    fruits[index].quantity++;
    fruits.refresh();
  }

  void decreaseQty(int index) {
    if (fruits[index].quantity > 1) {
      fruits[index].quantity--;
      fruits.refresh();
    }
  }

  void removeItem(int index) {
    fruits.removeAt(index);
  }
}
