import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/categories_controller.dart';
import 'package:e_shop_ui/buyer/screens/categories_screen/subcategories_screen.dart';
import 'package:e_shop_ui/buyer/screens/wishlist_screen/wishlist_screen.dart';
import 'package:e_shop_ui/common/controllers/bottom_nav_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/widgets/custom_top_bar.dart';

class CategoriesScreen extends GetView<CategoriesController> {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return Scaffold(
      appBar: CustomTopBar(
        title: 'Categories',
        action: Row(
          children: [
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
      ),
      body: ListView.builder(
        itemCount: controller.categories.length,
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: horizontalPadding),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => SubCategoriesScreen(
                  categoryName: controller.categories[index].name!, id: 'abc'));
            },
            child: Stack(
              children: [
                Container(
                  height: 85.h,
                  margin: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: horizontalPadding,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    color: CustomColors.primary.withOpacity(0.7),
                  ),
                ),
                Container(
                  height: 85.h,
                  margin: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: horizontalPadding,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    image: DecorationImage(
                      image: AssetImage(controller.categories[index].image!),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(.4),
                        BlendMode.dstATop,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      controller.categories[index].name!,
                      style: globalTextStyle(
                        fontSize: 22.sp,
                        color: CustomColors.secondary,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
