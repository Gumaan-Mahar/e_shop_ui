import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/my_orders_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_app_bar.dart';

import 'components/order_tile.dart';

class MyOrdersScreen extends GetView<MyOrdersController> {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyOrdersController());
    return Scaffold(
      appBar: CustomAppBar(
        title: "My Orders".tr,
        hasBackButton: true,
      ),
      body: ListView.builder(
        itemCount: controller.orders.length,
        padding: EdgeInsets.all(horizontalPadding),
        itemBuilder: (BuildContext context, int index) {
          final order = controller.orders[index];
          return OrderTile(order: order);
        },
      ),
    );
  }
}
