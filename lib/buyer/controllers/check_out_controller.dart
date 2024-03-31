import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/models/cart_model.dart';
import 'package:e_shop_ui/buyer/screens/payment_success_screen.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

class CheckoutController extends GetxController {
  final Rx<CartModel> cart = CartModel().obs;
  final RxString paymentMode = ''.obs;

  final List<Map<String, dynamic>> paymentModes = [
    {
      'name': 'Debit Card',
      'icon': 'assets/images/card.png',
    },
    {
      'name': 'KNET',
      'icon': 'assets/images/knet.jpeg',
    },
    {
      'name': 'Cash on Delivery',
      'icon': 'assets/images/cash.png',
    },
  ];

  @override
  void onInit() {
    paymentMode(paymentModes[0]['name']);
    super.onInit();
  }

  void handlePay() {
    final UserController userController = Get.find();
    if (userController.currentUser.value.address == null) {
      showToast('Select delivery address', status: 'info');
    } else {
      Get.to(() => const PaymentSuccessScreen());
      clearFields();
    }
  }

  void clearFields() {
    final UserController userController = Get.find();
    userController.cart.value = CartModel(
      items: [],
      total: 0,
    );
    // ignore: invalid_use_of_protected_member
    userController.cart.refresh();
    paymentMode(paymentModes[0]['name']);
    cart.value = CartModel();
  }
}
