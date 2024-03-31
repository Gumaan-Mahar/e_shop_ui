import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/models/cart_model.dart';
import 'package:e_shop_ui/buyer/services/product_services.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/helpers/show_toast.dart';


class ProductDetailsController extends GetxController {
  final RxInt selectedImage = 100.obs; // 100 index means no image is selected
  final RxString selectedSize = 'M'.obs;
  final RxString selectedColor = ''.obs;

  final productsFuture = Future.value().obs;

  @override
  void onInit() {
    productsFuture.value = ProductServices.getProducts(limit: 4);
    super.onInit();
  }

  void addToWishlist(CartItemModel item) {
    final UserController userController = Get.find();
    final List<int> ids = userController.wishlist.value.items!
        .map((element) => element.id!)
        .toList();

    if (ids.contains(item.id)) {
      // userController.cart.value.items!.remove(item);
      showToast('Product already in wishlist', status: 'info');
    } else {
      userController.wishlist.value.items!.insert(0, item);
      userController.wishlist.value.total =
          userController.wishlist.value.total! + item.price!;
      userController.wishlist.refresh();
      showToast('Product added to wishlist');
    }
  }

  void addToBag(CartItemModel item) {
    final UserController userController = Get.find();
    final List<int> ids =
        userController.cart.value.items!.map((element) => element.id!).toList();

    if (ids.contains(item.id)) {
      // userController.cart.value.items!.remove(item);
      showToast('Product already in cart', status: 'info');
    } else {
      userController.cart.value.items!.insert(0, item);
      userController.cart.value.total =
          userController.cart.value.total! + item.price!;
      userController.cart.refresh();
      showToast('Product added to cart');
    }
  }
}
