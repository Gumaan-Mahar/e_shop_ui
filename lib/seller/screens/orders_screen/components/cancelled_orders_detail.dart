import 'package:get/get.dart';
import 'package:e_shop_ui/seller/controllers/order_screen_controller.dart';

import '../../../../core/imports/core_imports.dart';
import 'order_container.dart';

class CancelledOrdersDetail extends GetView<OrderScreenController> {
  const CancelledOrdersDetail({super.key});

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
          children: controller.cancelledOrders
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
