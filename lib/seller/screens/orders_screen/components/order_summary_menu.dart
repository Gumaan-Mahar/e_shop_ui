import 'package:get/get.dart';

import '../../../../core/imports/core_imports.dart';
import '../../../controllers/order_screen_controller.dart';

class OrderSummaryMenu extends GetView<OrderScreenController> {

  const OrderSummaryMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: controller.orderTypes.map((order) {
            var isSelected = controller.selectedOrderType.value ==
                order.orderName;
            return InkWell(
              onTap: () => controller.selectedOrderType.value =
                  order.orderName,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8.h,
                  horizontal:
                      controller.orderTypes.indexOf(order) == 0
                          ? 28.w
                          : 12.w,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 2.w,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? CustomColors.primary
                      : CustomColors.secondaryDark,
                  borderRadius: BorderRadius.circular(
                    10.w,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      order.orderName.tr,
                      style: globalTextStyle(
                        fontSize: 12.sp,
                        color: isSelected
                            ? CustomColors.secondary
                            : Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      order.orderQuantity.toString(),
                      style: globalTextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: isSelected
                            ? CustomColors.secondary
                            : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
