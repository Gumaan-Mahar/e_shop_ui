import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/seller/controllers/order_screen_controller.dart';
import 'package:e_shop_ui/seller/models/order_type_model.dart';
import 'package:e_shop_ui/seller/screens/orders_screen/components/cancelled_orders_detail.dart';
import 'package:e_shop_ui/seller/screens/orders_screen/components/order_summary_menu.dart';
import 'package:e_shop_ui/seller/screens/orders_screen/components/process_orders_detail.dart';
import 'package:e_shop_ui/seller/screens/orders_screen/components/shipped_orders_detail.dart';
import 'package:e_shop_ui/widgets/custom_app_bar.dart';

import 'components/all_orders_detail.dart';

class OrdersScreen extends GetView<OrderScreenController> {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenController());

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'my order',
        hasBackButton: false,
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                  top: 16.h,
                  right: 16.w,
                ),
                child: Text(
                  'order summary'.tr,
                  style: globalTextStyle(
                    color: CustomColors.primary,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              const OrderSummaryMenu(),
              SizedBox(
                height: 16.h,
              ),
              const Divider(
                thickness: 1,
                color: CustomColors.borderColor,
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () {
                String selectedOrder = controller.selectedOrderType.value;
                OrderTypeModel selectedData = controller.orderTypes.firstWhere(
                  (orderType) => orderType.orderName == selectedOrder,
                );

                return selectedOrder == controller.orderTypes[0].orderName
                    ? const AllOrderDetail()
                    : selectedOrder == controller.orderTypes[1].orderName
                        ? const ProcessOrderDetail()
                        : selectedData == controller.orderTypes[2]
                            ? const ShippedOrdersDetail()
                            : selectedData == controller.orderTypes[3]
                                ? const CancelledOrdersDetail()
                                : const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
