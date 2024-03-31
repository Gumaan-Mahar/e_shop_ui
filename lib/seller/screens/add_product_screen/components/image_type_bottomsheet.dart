import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_shop_ui/core/imports/packages_imports.dart';
import 'package:e_shop_ui/seller/controllers/add_product_screen_controller.dart';

import '../../../../core/imports/core_imports.dart';

class ImageTypeBottomSheet extends GetView<AddProductController> {
  final bool? allowMultipleImage;
  const ImageTypeBottomSheet({
    super.key,
    this.allowMultipleImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(
              FlutterRemix.camera_line,
              size: 24.w,
              color: CustomColors.grayDark,
            ),
            title: Text(
              'capture a photo with camera'.tr,
              style: globalTextStyle(
                fontSize: 14.sp,
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              final XFile? capturedPhoto =
                  await controller.pickImageFromCamera();
              if (capturedPhoto != null) {
                if (allowMultipleImage == true) {
                  controller.selectedProductImages.add(capturedPhoto);
                } else {
                  controller.selectedDisplayImage.value = capturedPhoto;
                }
              }
            },
          ),
          ListTile(
            leading: Icon(
              FlutterRemix.image_line,
              size: 24.w,
              color: CustomColors.grayDark,
            ),
            title: Text(
              allowMultipleImage == true
                  ? 'choose images from gallery'.tr
                  : 'choose an image from gallery'.tr,
              style: globalTextStyle(
                fontSize: 14.sp,
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              if (!allowMultipleImage!) {
                await controller.pickImageFromGallery();
              } else {
                await controller.pickMultipleImagesFromGallery();
              }
            },
          ),
        ],
      ),
    );
  }
}
