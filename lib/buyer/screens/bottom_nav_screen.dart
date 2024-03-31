import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/screens/cart_screen/cart_screen.dart';
import 'package:e_shop_ui/buyer/screens/categories_screen/categories_screen.dart';
import 'package:e_shop_ui/buyer/screens/profile_screen/profile_screen.dart';
import 'package:e_shop_ui/buyer/screens/shops_screens/shops_screen.dart';
import 'package:e_shop_ui/common/controllers/bottom_nav_controller.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/widgets/custom_navigation_bar.dart';
import 'package:e_shop_ui/widgets/nav_item.dart';

import 'home_screen/home_screen.dart';

class BottomNavScreenBuyer extends GetView<CustomNavController> {
  const BottomNavScreenBuyer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomNavController(), permanent: true);
    Get.put(UserController(), permanent: true);
    const List<Widget> screens = [
      HomeScreen(),
      CategoriesScreen(),
      ShopsScreen(),
      CartScreen(),
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
            icon: FlutterRemix.function_line,
            title: 'category'.tr,
            index: 1,
          ),
          NavItem(
            icon: FlutterRemix.store_2_line,
            title: 'shop'.tr,
            index: 2,
          ),
          NavItem(
            icon: FlutterRemix.shopping_bag_2_line,
            title: 'cart'.tr,
            index: 3,
          ),
          NavItem(
            icon: FlutterRemix.user_3_line,
            title: 'profile'.tr,
            index: 4,
          ),
        ],
      ),
    );
  }
}
