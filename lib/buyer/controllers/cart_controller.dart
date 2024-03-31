import 'package:get/get.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/buyer/models/cart_model.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

class CartController extends GetxController {
  final UserController userController = Get.find();

  final TextEditingController promoCodeController = TextEditingController();

  void incrementQuantity(int index, CartItemModel item) {
    userController.cart.value.items![index].quantity = item.quantity! + 1;
    userController.cart.value.total =
        userController.cart.value.total! + item.price!;
    userController.cart.refresh();
  }

  void decrementQuantity(int index, CartItemModel item) {
    if (item.quantity != 1) {
      userController.cart.value.items![index].quantity = item.quantity! - 1;
      userController.cart.value.total =
          userController.cart.value.total! - item.price!;
      userController.cart.refresh();
    }
  }

  void removeItem(CartItemModel item) {
    userController.cart.value.items!.remove(item);
    userController.cart.value.total =
        userController.cart.value.total! - (item.price! * item.quantity!);
    userController.cart.refresh();
  }

  void changeSize(int index, String newValue) {
    userController.cart.value.items![index].size = newValue;
    userController.cart.refresh();
  }

  void changeColor(int index, String newValue) {
    userController.cart.value.items![index].color = newValue;
    userController.cart.refresh();
  }



  @override
  void onClose() {
    promoCodeController.dispose();
    super.onClose();
  }
}
