import 'dart:io';

import 'package:get/get.dart';
import 'package:e_shop_ui/common/controllers/bottom_nav_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

import 'nav_item.dart';

class CustomNavBar extends GetView<CustomNavController> {
  final List<NavItem> items;

  const CustomNavBar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Platform.isAndroid ? 70.h : 80.h,
      padding: EdgeInsets.only(bottom: Platform.isAndroid ? 0.h : 15.h, right: 25.w, left: 25.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items
                .map(
                  (e) => Obx(
                    () => GestureDetector(
                      onTap: () => controller.selectedTab.value = e.index,
                      child: Column(
                        children: [
                          Icon(
                            e.icon,
                            size: 22.h,
                            color: controller.selectedTab.value == e.index
                                ? CustomColors.primary
                                : CustomColors.grayDark,
                          ),
                          SizedBox(height: 3.h),
                          controller.selectedTab.value == e.index
                              ? Text(
                                  e.title.tr,
                                  style: globalTextStyle(fontSize: 12.sp),
                                )
                              : SizedBox(height: 15.h),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      
    );
  }
}
