import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/shop_controller.dart';
import 'package:e_shop_ui/buyer/screens/shops_screens/shop_category_screen.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/widgets/custom_top_bar.dart';

class ShopsScreen extends GetView<ShopsController> {
  const ShopsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ShopsController());
    return Scaffold(
      appBar: const CustomTopBar(title: 'Shops'),
      body: ListView.builder(
        itemCount: controller.shops.length,
        padding: EdgeInsets.symmetric(
          vertical: horizontalPadding,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                leading: Container(
                  height: Get.height,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.black54,
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        controller.shops[index].image!,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  controller.shops[index].name!.tr,
                  style: globalTextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  controller.shops[index].description!,
                  style: globalTextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                trailing: Icon(
                  Get.locale == const Locale('ur')
                      ? FlutterRemix.arrow_left_s_line
                      : FlutterRemix.arrow_right_s_line,
                  color: CustomColors.grayDark,
                ),
                onTap: () {
                  Get.to(() => ShopCategoryScreen(
                      name: controller.shops[index].name!, id: 'abc'));
                },
              ),
              const Divider(
                color: CustomColors.borderColor,
              ),
            ],
          );
        },
      ),
    );
  }
}
