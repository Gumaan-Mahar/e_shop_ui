import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/shopcategory_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/widgets/custom_app_bar.dart';

import '../categories_screen/subcategories_screen.dart';

class ShopCategoryScreen extends GetView<ShopCategoryController> {
  final String id;
  final String name;
  const ShopCategoryScreen({required this.id, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ShopCategoryController());
    return Scaffold(
      appBar: CustomAppBar(title: name.tr, hasBackButton: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Image.asset('assets/images/banner_2.jpg'),
              SizedBox(height: 20.h),
              GridView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: Get.width / (Get.height / 2.9),
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () => SubCategoriesScreen(
                            categoryName: controller.categories[index].name!,
                            id: 'abc'),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 100.h,
                          margin: EdgeInsets.symmetric(
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.r),
                            color: CustomColors.primary.withOpacity(0.7),
                          ),
                        ),
                        Container(
                          height: 100.h,
                          margin: EdgeInsets.symmetric(
                            vertical: 5.h,
                            // horizontal: horizontalPadding,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.r),
                            image: DecorationImage(
                              image: AssetImage(
                                  controller.categories[index].image!),
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
                                fontSize: 20.sp,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
