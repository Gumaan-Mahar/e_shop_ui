import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/seller/screens/add_product_screen/add_product_details.dart';
import 'package:e_shop_ui/seller/screens/home_screen/components/product_bottom_sheet.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';
import 'package:e_shop_ui/widgets/custom_top_bar.dart';

import '../../controllers/home_screen_controller.dart';
import 'components/product_tile.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController(), permanent: true);
    return Scaffold(
      appBar: CustomTopBar(
        title: 'products',
        action: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: CustomButton(
            text: 'add product',
            width: Get.width * 0.4,
            marginRight: 10.w,
            marginLeft: 10.w,
            textSize: 13.sp,
            onTap: () => Get.to(
              () => const AddProductDetials(),
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.products.isEmpty
            ? Center(
                child: SizedBox(
                  width: Get.width * 0.6,
                  child: Text(
                    'no products'.tr,
                    textAlign: TextAlign.center,
                    style: globalTextStyle(
                      fontSize: 14.sp,
                      color: CustomColors.grayDark,
                    ),
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                child: GridView.builder(
                  itemCount: controller.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 40,
                  ),
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return ProductTile(
                      product: product,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return ProductBottomSheet(
                              product: product,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
      ),
    );
  }
}
