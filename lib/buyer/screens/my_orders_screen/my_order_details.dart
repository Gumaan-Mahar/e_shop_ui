import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/models/order_model.dart';
import 'package:e_shop_ui/buyer/screens/my_orders_screen/components/summary_section.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/helpers/format_address.dart';

import 'components/status_section.dart';

class MyOrderDetails extends StatelessWidget {
  final OrderModel order;

  const MyOrderDetails({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.secondary,
        centerTitle: true,
        elevation: 1,
        shadowColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Get.locale == const Locale('ur')
                ? FlutterRemix.arrow_right_s_line
                : FlutterRemix.arrow_left_s_line,
            color: CustomColors.primary,
            size: 24.h,
          ),
          onPressed: () => Get.back(),
        ),
        iconTheme: const IconThemeData(
          color: CustomColors.primary,
        ),
        title: Column(
          children: [
            Text(
              'Order Details'.tr,
              style: globalTextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              order.id.toString(),
              style: globalTextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(horizontalPadding),
            child: Column(
              children: [
                StatusSection(
                  currentStatus: order.status!,
                  status: 'Ordered',
                  date: order.placedAt!,
                  icon: 'assets/icons/ordered.svg',
                ),
                StatusSection(
                  currentStatus: order.status!,
                  status: 'Out for delivery',
                  date: order.placedAt!.add(
                    const Duration(days: 1, hours: 4),
                  ),
                  icon: 'assets/icons/out_for_delivery.svg',
                ),
                StatusSection(
                  currentStatus: order.status!,
                  status: 'Delivered',
                  date: order.placedAt!.add(
                    const Duration(days: 1),
                  ),
                  icon: 'assets/icons/delivered.svg',
                ),
              ],
            ),
          ),
          const Divider(
            color: CustomColors.borderColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Address'.tr,
                  style: globalTextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  formatAddress(order.address!),
                  style: globalTextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  order.phone!,
                  style: globalTextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomSheet: SummarySection(
        order: order,
      ),
    );
  }
}
