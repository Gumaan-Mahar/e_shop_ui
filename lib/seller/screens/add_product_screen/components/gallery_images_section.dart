import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';

import '../../../../core/imports/core_imports.dart';
import '../../../controllers/add_product_screen_controller.dart';
import 'add_image_button.dart';
import 'image_container.dart';
import 'image_type_bottomsheet.dart';

class GalleryImagesSection extends GetView<AddProductController> {
  const GalleryImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'gallery images'.tr,
            style: globalTextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          controller.selectedProductImages.isNotEmpty
              ? GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.w,
                    mainAxisSpacing: 8.h,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.selectedProductImages.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) =>
                                const ImageTypeBottomSheet(
                              allowMultipleImage: true,
                            ),
                          );
                        },
                        child: Center(
                          child: Icon(
                            FlutterRemix.image_add_line,
                            size: 28.w,
                            color: CustomColors.grayDark,
                          ),
                        ),
                      );
                    } else {
                      return ImageContainer(
                        fileImage: controller.selectedProductImages[index - 1],
                        onDelete: () {
                          controller.selectedProductImages.removeAt(index - 1);
                        },
                      );
                    }
                  },
                )
              : AddImageButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => const ImageTypeBottomSheet(
                        allowMultipleImage: true,
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
