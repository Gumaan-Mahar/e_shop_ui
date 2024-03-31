import 'package:get/get.dart';

import '../../../../core/imports/core_imports.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../models/order_model.dart';
import 'components/order_detail_summary.dart';
import 'components/order_shipment_status.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderModel order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'my orders',
        hasBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderShipmentStatus(
                    orderStatus: 'ordered',
                    icon: 'assets/icons/ordered.svg',
                    orderedDate: order.orderedDate,
                  ),
                  OrderShipmentStatus(
                    orderStatus: 'out for delivery',
                    orderedDate: order.outForDeliveryDate,
                    icon: 'assets/icons/out_for_delivery.svg',
                  ),
                  OrderShipmentStatus(
                    orderStatus: 'delivered',
                    icon: 'assets/icons/delivered.svg',
                    iconColor: CustomColors.grayDark,
                    orderedDate: order.deliveredDate,
                    showDivider: false,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: CustomColors.borderColor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'select delivery address'.tr,
                    style: globalTextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    width: Get.width * 0.6,
                    child: Text(
                      'Kashmir Stop, Lane 3, Block B, Building 5, Karachi City',
                      style: globalTextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: OrderDetailSummary(
        order: order,
      ),
    );
  }
}
