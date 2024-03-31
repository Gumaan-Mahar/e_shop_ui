
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_shop_ui/seller/controllers/add_product_screen_controller.dart';
import 'package:e_shop_ui/seller/models/product_model.dart';
import 'package:e_shop_ui/seller/screens/add_product_screen/add_product_images.dart';
import 'package:e_shop_ui/widgets/custom_button.dart';

import '../../../core/imports/core_imports.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_outlined_textfield.dart';

class AddProductDetials extends StatefulWidget {
  final ProductModel? product;
  const AddProductDetials({super.key, this.product});

  @override
  State<AddProductDetials> createState() => _AddProductDetialsState();
}

class _AddProductDetialsState extends State<AddProductDetials> {
  @override
  void initState() {
    final AddProductController controller = Get.put(AddProductController());
    if (widget.product != null) {
      controller.editingProduct.value = widget.product!;
    }
    if (controller.editingProduct.value.id != null) {
      controller.nameController.text = controller.editingProduct.value.name!;
      controller.arNameController.text =
          controller.editingProduct.value.arName!;
      controller.descriptionController.text =
          controller.editingProduct.value.description!;
      controller.arDescriptionController.text =
          controller.editingProduct.value.arDescription!;
      controller.priceController.text =
          controller.editingProduct.value.price!.toString();
      controller.noOfStockController.text =
          controller.editingProduct.value.noOfStocks!.toString();
      controller.selectedDisplayImage.value =
          XFile(controller.editingProduct.value.displayImage!);
      controller.selectedProductImages.value =
          controller.editingProduct.value.images!.map((e) => XFile(e)).toList();
      controller.colors.value = controller.editingProduct.value.colors!;
      controller.productVariations.value =
          controller.editingProduct.value.variations!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AddProductController controller = Get.put(AddProductController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: controller.editingProduct.value.id != null
              ? 'edit product'
              : 'add product',
          hasBackButton: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: Form(
              key: controller.addProductDetailFormKey,
              child: Column(
                children: [
                  CustomOutlinedTextField(
                    textEditingController: controller.nameController,
                    label: 'product name (english)',
                    hintText: 'enter product name in english',
                    validator: (String? value) =>
                        controller.validateTextField(value),
                  ),
                  CustomOutlinedTextField(
                    textEditingController: controller.arNameController,
                    label: 'product name (arabic)',
                    hintText: 'enter product name in arabic',
                    validator: (String? value) =>
                        controller.validateTextField(value),
                  ),
                  CustomOutlinedTextField(
                    textEditingController: controller.descriptionController,
                    label: 'product description (english)',
                    hintText: 'enter product description in english',
                    maxlines: 4,
                    validator: (String? value) =>
                        controller.validateTextField(value),
                  ),
                  CustomOutlinedTextField(
                    textEditingController: controller.arDescriptionController,
                    label: 'product Description (arabic)',
                    hintText: 'enter product description in arabic',
                    maxlines: 4,
                    validator: (String? value) =>
                        controller.validateTextField(value),
                  ),
                  CustomButton(
                    width: Get.width * 0.8,
                    text: 'save & continue',
                    textSize: 14.sp,
                    onTap: () {
                      if (controller.addProductDetailFormKey.currentState!
                          .validate()) {
                        Get.to(
                          () {
                            if (controller.editingProduct.value.id != null) {
                              return AddProductImages(
                                  product: controller.editingProduct.value);
                            }
                            return const AddProductImages();
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
