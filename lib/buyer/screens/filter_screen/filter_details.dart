import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/controllers/filterdetails_controller.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';

import '../../../widgets/custom_app_bar.dart';

class FilterDetailScreen extends GetView<FilterDetailController> {
  final String title;
  const FilterDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Get.put( FilterDetailController());
    return Scaffold(
      appBar: CustomAppBar(
        title: title.tr,
        hasBackButton: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Obx(
            () => ListTile(
              title: Text(controller.brands[index].name.tr,
                  style: globalTextStyle(fontSize: 12.sp)),
              trailing: controller.brands[index].isFavorite
                  ? const Icon(FlutterRemix
                      .check_line) // Replace 'Icons.check' with your desired icon
                  : const SizedBox(),
              onTap: () {
                controller.selectTab(index);
              },
            ),
          );
        },
        itemCount: controller.brands.length,
      ),
    );
  }
}
