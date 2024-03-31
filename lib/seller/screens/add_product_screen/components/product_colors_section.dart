
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:e_shop_ui/core/extensions/hex_color.dart';
import 'package:e_shop_ui/helpers/get_color.dart' as hex;
import 'package:e_shop_ui/seller/controllers/add_product_screen_controller.dart';

import '../../../../core/imports/core_imports.dart';
import '../../../../core/imports/packages_imports.dart';
import 'color_container.dart';

class ProductColorsSection extends GetView<AddProductController> {
  const ProductColorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'product colors'.tr,
              style: globalTextStyle(
                fontSize: 14.sp,
              ),
            ),
            GestureDetector(
              onTap: () => {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('pick a color!'.tr),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          hexInputBar: true,
                          pickerColor: controller.defaultColor,
                          onColorChanged: (Color color) => {
                            controller.selectedColor.value = color.toHex(),
                          },
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text('select'.tr),
                          onPressed: () => {
                            Navigator.of(context).pop(),
                            controller.updateColors(
                              controller.selectedColor.value,
                            ),
                          },
                        ),
                      ],
                    );
                  },
                ),
              },
              child: Icon(
                FlutterRemix.add_circle_fill,
                size: 22.sp,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: Get.height * 0.1,
          child: Obx(
            () => controller.colors.isEmpty
                ? Center(
                    child: Text(
                      'no selected colors'.tr,
                      style: globalTextStyle(
                        fontSize: 14.sp,
                        color: CustomColors.grayDark,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.colors.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return ColorContainer(
                        color: hex.HexColor(controller.colors[index]),
                        index: index,
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
