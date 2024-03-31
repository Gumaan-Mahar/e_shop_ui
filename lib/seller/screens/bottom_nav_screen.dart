import 'package:get/get.dart';
import 'package:e_shop_ui/common/controllers/bottom_nav_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/seller/screens/orders_screen/orders_screen.dart';
import 'package:e_shop_ui/widgets/custom_navigation_bar.dart';
import 'package:e_shop_ui/widgets/nav_item.dart';

import 'home_screen/home_screen.dart';
import 'profile_screen/profile_screen.dart';

class BottomNavScreen extends GetView<CustomNavController> {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomNavController());
    const List<Widget> screens = [
      HomeScreen(),
      OrdersScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      body: Obx(
        () => screens[controller.selectedTab.value],
      ),
      bottomNavigationBar: CustomNavBar(
        items: [
          NavItem(
            icon: FlutterRemix.home_5_line,
            title: 'home'.tr,
            index: 0,
          ),
          NavItem(
            icon: FlutterRemix.list_unordered,
            title: 'order'.tr,
            index: 1,
          ),
          NavItem(
            icon: FlutterRemix.user_3_line,
            title: 'profile'.tr,
            index: 2,
          ),
        ],
      ),
    );
  }
}
