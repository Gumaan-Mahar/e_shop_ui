import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/home_controller.dart';
import 'package:e_shop_ui/buyer/models/order_model.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/common/models/user_model.dart';

class MyOrdersController extends GetxController {
  final UserController userController = Get.find();
  final RxList<OrderModel> orders = <OrderModel>[].obs;

  @override
  void onInit() {
    final HomeController homeController = Get.find();
    final AddressModel address = AddressModel(
      goverorate: 'Karachi',
      area: 'Kashmir Stop',
      block: '4',
      street: 'Street 21',
      avenue: 'Avenue 3',
      building: 'Building 14',
      floor: 'Floor 4',
      apartment: 'Apartment 2',
    );
    orders.value = [
      OrderModel(
        id: 1,
        status: 'Ordered',
        address: address,
        phone: userController.currentUser.value.phoneNo,
        total: homeController.products[0].price,
        promoCode: 'Test',
        paymentMode: 'KNET',
        placedAt: DateTime.now().subtract(
          const Duration(days: 1),
        ),
        products: [
          homeController.products[0],
        ],
      ),
      OrderModel(
        id: 2,
        status: 'Out for delivery',
        address: address,
        phone: userController.currentUser.value.phoneNo,
        total: homeController.products[1].price! +
            homeController.products[2].price! +
            homeController.products[3].price!,
        promoCode: '',
        paymentMode: 'Debit Card',
        placedAt: DateTime.now().subtract(
          const Duration(days: 2),
        ),
        products: [
          homeController.products[1],
          homeController.products[2],
          homeController.products[3],
        ],
      ),
      OrderModel(
        id: 3,
        status: 'Delivered',
        address: address,
        phone: userController.currentUser.value.phoneNo,
        total: homeController.products[1].price! +
            homeController.products[2].price! +
            (homeController.products[3].price! * 3),
        promoCode: '',
        paymentMode: 'Cash on Delivery',
        placedAt: DateTime.now().subtract(
          const Duration(days: 2),
        ),
        products: [
          homeController.products[1],
          homeController.products[2],
          homeController.products[3],
          homeController.products[3],
          homeController.products[3],
        ],
      ),
    ];
    super.onInit();
  }
}
