import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/seller/screens/order_details_screen/components/dotted_vertical_divider.dart';

class StatusSection extends StatelessWidget {
  final String currentStatus;
  final String status;
  final String icon;
  final DateTime date;

  const StatusSection({
    super.key,
    required this.currentStatus,
    required this.status,
    required this.icon,
    required this.date,
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
              height: 22.h,
              colorFilter: ColorFilter.mode(
                status.tr == currentStatus.tr
                    ? CustomColors.primary
                    : CustomColors.grayDark,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            if (status != 'Delivered'.tr)
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4.h,
                ),
                child: const DottedVerticalDivider(),
              ),
          ],
        ),
        SizedBox(
          width: 16.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              status.tr,
              style: globalTextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              formatDate(
                date,
                [HH, ':', nn, ' ', am, ' ', d, ' ', M, ' ', yyyy],
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
