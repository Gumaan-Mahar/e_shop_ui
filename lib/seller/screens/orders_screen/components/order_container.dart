import 'package:get/get.dart';
import 'package:e_shop_ui/seller/controllers/order_screen_controller.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';
import 'package:e_shop_ui/widgets/custom_drop_down.dart';

import '../../../../core/imports/core_imports.dart';
import '../../../models/order_model.dart';
import '../../order_details_screen/order_details_screen.dart';

class OrderContainer extends GetView<OrderScreenController> {
  final OrderModel order;
  const OrderContainer({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    final RxString selectedStatus = 'process'.obs;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
        vertical: 18.h,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: CustomColors.borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(
          10.w,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * 0.45,
                child: Text(
                  '${'order id'.tr} ${order.orderId}',
                  style: globalTextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Text(
                '${'${'placed'.tr}:'} ${order.orderedDate.day}/${order.orderedDate.month}/${order.orderedDate.year}',
                style: globalTextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: Get.width * 0.35,
                height: 44.h,
                textSize: 16.sp,
                text: 'details',
                onTap: () => Get.to(
                  () => OrderDetailsScreen(
                    order: order,
                  ),
                ),
              ),
              CustomDropdownButton(
                width: Get.width * 0.33,
                value: selectedStatus,
                items: controller.statuses,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
