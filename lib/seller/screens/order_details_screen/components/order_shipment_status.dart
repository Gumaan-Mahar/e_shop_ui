import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';

import '../../../../core/imports/core_imports.dart';
import '../../../controllers/order_screen_controller.dart';
import 'dotted_vertical_divider.dart';

class OrderShipmentStatus extends GetView<OrderScreenController> {
  final String orderStatus;
  final DateTime orderedDate;
  final String icon;
  final Color? iconColor;
  final bool showDivider;
  const OrderShipmentStatus({
    super.key,
    required this.orderStatus,
    required this.orderedDate,
    required this.icon,
    this.iconColor,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                iconColor ?? CustomColors.primary,
                BlendMode.srcIn,
              ),
            ),
            showDivider
                ? SizedBox(
                    height: 4.h,
                  )
                : const SizedBox.shrink(),
            showDivider
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 4.h,
                    ),
                    child: const DottedVerticalDivider(),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        SizedBox(
          width: 16.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orderStatus.tr,
              style: globalTextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              controller.formatDateTime(
                orderedDate,
              ),
              style: globalTextStyle(
                fontSize: 11.sp,
                color: CustomColors.grayDark,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
