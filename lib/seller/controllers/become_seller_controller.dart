import 'package:get/get.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/common/models/user_model.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

class BecomeSellerController extends GetxController {
  final UserController userController = Get.find();

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController productsController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();

  final RxString selectedCategory = 'T-shirts'.obs;
  final RxBool acceeptedTerms = false.obs;

  @override
  void onInit() {
    if (userController.currentUser.value.seller != null) {
      nameController.text = userController.currentUser.value.seller!.name!;
      selectedCategory.value =
          userController.currentUser.value.seller!.category!;
      productsController.text =
          userController.currentUser.value.seller!.products.toString();
      addressController.text =
          userController.currentUser.value.seller!.shopAddress!;
      phoneNoController.text =
          userController.currentUser.value.seller!.phoneNo!;
    }
    super.onInit();
  }

  void handleSave({required VoidCallback navigateTo}) {
    if (formKey.currentState!.validate()) {
      if (acceeptedTerms.value) {
        userController.currentUser.update((user) {
          user!.seller = SellerModel(
            name: nameController.text.trim(),
            category: selectedCategory.value,
            products: int.parse(productsController.text),
            shopAddress: addressController.text.trim(),
            phoneNo: phoneNoController.text.trim(),
          );
        });
        userController.currentUser.refresh();
        navigateTo();
      } else {
        showToast('Please accept terms and conditions', status: 'info');
      }
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    productsController.dispose();
    addressController.dispose();
    phoneNoController.dispose();

    super.onClose();
  }
}
