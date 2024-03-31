import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/home_controller.dart';
import 'package:e_shop_ui/buyer/screens/home_screen/components/recommended_products.dart';
import 'package:e_shop_ui/buyer/screens/wishlist_screen/wishlist_screen.dart';
import 'package:e_shop_ui/common/controllers/bottom_nav_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';

import 'components/featured_products.dart';
import 'components/new_in_products.dart';
import 'components/search_field.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'E-SHOP'.tr,
              style: globalTextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: CustomColors.primary,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              'UI'.tr,
              style: globalTextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: CustomColors.primary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              final CustomNavController customNavController = Get.find();
              customNavController.selectedTab(3);
            },
            icon: const Icon(
              FlutterRemix.shopping_bag_3_line,
              color: CustomColors.grayDark,
            ),
          ),
          IconButton(
            onPressed: () => Get.to(() => const WishlistScreen()),
            icon: const Icon(
              FlutterRemix.heart_3_line,
              color: CustomColors.grayDark,
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14.h),
              const SearchField(),
              SizedBox(height: 20.h),
              Image.asset('assets/images/banner_1.jpg'),
              SizedBox(height: 20.h),
              Center(
                child: CustomButton(
                  textSize: 14.sp,
                  width: Get.width * 0.7,
                  text: 'explore more',
                  onTap: () {},
                ),
              ),
              SizedBox(height: 20.h),
              const NewInProducts(),
              SizedBox(height: Get.height * 0.07),
              Image.asset('assets/images/banner_2.jpg'),
              SizedBox(height: Get.height * 0.07),
              const RecommendedProducts(),
              SizedBox(height: Get.height * 0.07),
              Image.asset('assets/images/banner_3.jpg'),
              SizedBox(height: 20.h),
              Center(
                child: CustomButton(
                  textSize: 14.sp,
                  width: Get.width * 0.7,
                  text: 'explore more',
                  onTap: () {},
                ),
              ),
              SizedBox(height: 30.h),
              const FeaturedProducts(),
              SizedBox(height: 30.h),
              Center(
                child: CustomButton(
                  textSize: 14.sp,
                  width: Get.width * 0.7,
                  text: 'shop now',
                  onTap: () {},
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
