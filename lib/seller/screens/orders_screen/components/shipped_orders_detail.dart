import 'package:get/get.dart';

import '../../../../core/imports/core_imports.dart';
import '../../../controllers/order_screen_controller.dart';
import 'order_container.dart';

class ShippedOrdersDetail extends GetView<OrderScreenController> {
  const ShippedOrdersDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.shippedOrders
              .map(
                (order) => Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.h,
                  ),
                  child: OrderContainer(
                    order: order,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
