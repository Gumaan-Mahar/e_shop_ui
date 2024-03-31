import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_shop_ui/seller/screens/add_product_screen/components/add_image_button.dart';
import 'package:e_shop_ui/seller/screens/add_product_screen/components/image_type_bottomsheet.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';
import 'package:e_shop_ui/widgets/custom_outlined_textfield.dart';

import '../../../core/imports/core_imports.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../controllers/add_product_screen_controller.dart';
import '../../models/product_model.dart';
import 'add_product_options.dart';
import 'components/gallery_images_section.dart';
import 'components/image_container.dart';

class AddProductImages extends GetView<AddProductController> {
  final ProductModel? product;
  const AddProductImages({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final AddProductController controller = Get.put(AddProductController());
    final RxString hasAdvancedOptions = 'Yes'.obs;
    if (product != null) {
      controller.editingProduct.value = product!;
    }
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: controller.editingProduct.value.id != null
              ? 'edit product'
              : 'add product',
          hasBackButton: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: Form(
                        key: controller.addProductImagesFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'does the product have advanced options?'.tr,
                                  style: globalTextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Obx(
                                  () => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomButton(
                                        width: Get.width * 0.3,
                                        text: 'yes',
                                        color: hasAdvancedOptions.value == 'Yes'
                                            ? CustomColors.primary
                                            : CustomColors.secondary,
                                        textColor:
                                            hasAdvancedOptions.value == 'No'
                                                ? CustomColors.primary
                                                : CustomColors.secondary,
                                        onTap: () =>
                                            hasAdvancedOptions.value = 'Yes',
                                      ),
                                      CustomButton(
                                        width: Get.width * 0.3,
                                        text: 'no',
                                        color: hasAdvancedOptions.value == 'No'
                                            ? CustomColors.primary
                                            : CustomColors.secondary,
                                        textColor:
                                            hasAdvancedOptions.value == 'No'
                                                ? CustomColors.secondary
                                                : CustomColors.primary,
                                        onTap: () =>
                                            hasAdvancedOptions.value = 'No',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Obx(
                              () => CustomOutlinedTextField(
                                disabled: hasAdvancedOptions.value == 'No'
                                    ? true
                                    : false,
                                label: 'no. of stock',
                                labelColor: hasAdvancedOptions.value == 'No'
                                    ? CustomColors.grayLight
                                    : CustomColors.primary,
                                hintText:
                                    'enter the no. of stock of the product',
                                textEditingController:
                                    controller.noOfStockController,
                                keyboardType: TextInputType.phone,
                                validator: (String? value) =>
                                    hasAdvancedOptions.value == 'No'
                                        ? null
                                        : controller.validateTextField(value),
                              ),
                            ),
                            Obx(
                              () => CustomOutlinedTextField(
                                disabled: hasAdvancedOptions.value == 'No'
                                    ? true
                                    : false,
                                label: 'product price',
                                labelColor: hasAdvancedOptions.value == 'No'
                                    ? CustomColors.grayLight
                                    : CustomColors.primary,
                                hintText: 'enter the price of the product',
                                textEditingController:
                                    controller.priceController,
                                keyboardType: TextInputType.phone,
                                validator: (String? value) =>
                                    hasAdvancedOptions.value == 'No'
                                        ? null
                                        : controller.validateTextField(value),
                              ),
                            ),
                            Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'display image'.tr,
                                    style: globalTextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  controller.selectedDisplayImage.value.path
                                          .isNotEmpty
                                      ? ImageContainer(
                                          fileImage: controller
                                              .selectedDisplayImage.value,
                                          onDelete: () => controller
                                              .selectedDisplayImage
                                              .value = XFile(''),
                                        )
                                      : AddImageButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return const ImageTypeBottomSheet();
                                              },
                                            );
                                          },
                                        ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            const GalleryImagesSection(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.h,
              ),
              child: Center(
                child: CustomButton(
                  width: Get.width * 0.6,
                  text: 'submit',
                  marginBottom: 10.h,
                  onTap: () => {
                    if (controller.addProductImagesFormKey.currentState!
                        .validate())
                      {
                        if (controller.selectedDisplayImage.value.path.isEmpty)
                          {
                            showToast('please select display image',
                                status: 'info'),
                          }
                        else if (controller.selectedProductImages.length <
                            3)
                          {
                            showToast('please select at least 3 images',
                                status: 'info'),
                          }
                        else
                          {
                            Get.to(
                              () => const AddProductOptions(),
                            ),
                          }
                      }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
