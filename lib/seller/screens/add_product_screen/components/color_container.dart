import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/seller/controllers/add_product_screen_controller.dart';

import '../../../../core/imports/core_imports.dart';

class ColorContainer extends GetView<AddProductController> {
  final Color color;
  final int index;
  const ColorContainer({
    super.key,
    required this.color,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.colors.removeAt(index),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            margin: EdgeInsets.only(right: 10.w),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            top: 0,
            right: 12,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.grayDark.withOpacity(0.8),
              ),
              child: Icon(
                FlutterRemix.close_fill,
                size: 12.h,
                color: CustomColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
