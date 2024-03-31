import 'package:get/get.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/buyer/models/cart_model.dart';

class WishlistController extends GetxController {
  final UserController userController = Get.find();

  void incrementQuantity(int index, CartItemModel item) {
    userController.wishlist.value.items![index].quantity = item.quantity! + 1;
    userController.wishlist.value.total =
        userController.wishlist.value.total! + item.price!;
    userController.wishlist.refresh();
  }

  void decrementQuantity(int index, CartItemModel item) {
    if (item.quantity != 1) {
      userController.wishlist.value.items![index].quantity = item.quantity! - 1;
      userController.wishlist.value.total =
          userController.wishlist.value.total! - item.price!;
      userController.wishlist.refresh();
    }
  }

  void removeItem(CartItemModel item) {
    userController.wishlist.value.items!.remove(item);
    userController.wishlist.value.total =
        userController.wishlist.value.total! - (item.price! * item.quantity!);
    userController.wishlist.refresh();
  }

  void changeSize(int index, String newValue) {
    userController.wishlist.value.items![index].size = newValue;
    userController.wishlist.refresh();
  }

  void changeColor(int index, String newValue) {
    userController.wishlist.value.items![index].color = newValue;
    userController.wishlist.refresh();
  }
}
