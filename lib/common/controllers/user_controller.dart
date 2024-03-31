import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/models/cart_model.dart';
import 'package:e_shop_ui/buyer/models/product_model.dart';
import 'package:e_shop_ui/common/models/user_model.dart';

class UserController extends GetxController {
  final Rx<User> currentUser = User().obs;

  final Rx<CartModel> cart = CartModel(
    id: 1,
    items: [],
    total: 0.0,
  ).obs;
  final Rx<CartModel> wishlist = CartModel(
    id: 1,
    items: [],
    total: 0.0,
  ).obs;

  final RxList<ProductModel> favorites = <ProductModel>[].obs;
}
