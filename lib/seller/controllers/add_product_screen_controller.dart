import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_shop_ui/core/extensions/hex_color.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';
import 'package:e_shop_ui/seller/models/product_model.dart';
import 'package:e_shop_ui/seller/screens/bottom_nav_screen.dart';

import '../models/product_variation_model.dart';
import 'home_screen_controller.dart';

class AddProductController extends GetxController {
  final Rx<ProductModel> editingProduct = ProductModel().obs;

  final addProductDetailFormKey = GlobalKey<FormState>();
  final addProductImagesFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController arNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController arDescriptionController = TextEditingController();
  final TextEditingController noOfStockController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final Rx<XFile> selectedDisplayImage = XFile('').obs;
  final RxList<XFile> selectedProductImages = <XFile>[].obs;

  final RxList<ProductVariationModel> productVariations =
      <ProductVariationModel>[
    ProductVariationModel(
      size: 'S',
      stock: 1,
      price: 0.00,
    ),
  ].obs;
  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  final Color defaultColor = CustomColors.grayLight;
  final Rx<String> selectedColor = CustomColors.primary.toHex().obs;
  final RxList<String> colors = <String>[
    CustomColors.primary.toHex(),
  ].obs;

  final RxString productType = 'One'.obs;

  void updateColors(String color) {
    colors.value = [...colors, color];
  }

  void updateProductVariations(ProductVariationModel productVariation) {
    productVariations.value = [...productVariations, productVariation];
  }

  Future<XFile?> pickImageFromCamera() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      return pickedFile;
    }
    return null;
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedDisplayImage.value = pickedFile;
    }
  }

  Future<void> pickMultipleImagesFromGallery() async {
    final picker = ImagePicker();
    final List<XFile> pickedImages = await picker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      selectedProductImages.value = [
        ...selectedProductImages,
        ...pickedImages
      ];
    }
  }

  String? validateTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required'.tr;
    }
    return null;
  }

  void handleAddProduct(ProductModel product) {
    HomeScreenController homeScreenController = Get.find();

    if (editingProduct.value.id != null) {
      homeScreenController.products[homeScreenController.products
              .indexWhere((element) => element.id == editingProduct.value.id)] =
          product;
      homeScreenController.products.refresh();
    } else {
      homeScreenController.products.insert(0, product);
    }
    Get.offAll(() => const BottomNavScreen());
  }

  @override
  void dispose() {
    nameController.dispose();
    arNameController.dispose();
    descriptionController.dispose();
    arDescriptionController.dispose();
    noOfStockController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
