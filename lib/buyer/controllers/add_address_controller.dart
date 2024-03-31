import 'package:get/get.dart';
import 'package:e_shop_ui/common/controllers/user_controller.dart';
import 'package:e_shop_ui/common/models/user_model.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

class AddAddressController extends GetxController {
  final UserController userController = Get.find();

  final formKey = GlobalKey<FormState>();
  final TextEditingController goverorateController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController blockController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController avenueController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();

  @override
  void onInit() {
    if (userController.currentUser.value.address != null) {
      goverorateController.text =
          userController.currentUser.value.address!.goverorate!;
      areaController.text = userController.currentUser.value.address!.area!;
      blockController.text = userController.currentUser.value.address!.block!;
      streetController.text = userController.currentUser.value.address!.street!;
      avenueController.text = userController.currentUser.value.address!.avenue!;
      buildingController.text =
          userController.currentUser.value.address!.building!;
      floorController.text = userController.currentUser.value.address!.floor!;
      apartmentController.text =
          userController.currentUser.value.address!.apartment!;
    }
    super.onInit();
  }

  void handleAddAddress() {
    if (formKey.currentState!.validate()) {
      userController.currentUser.update((user) {
        user!.address = AddressModel(
          goverorate: goverorateController.text.trim(),
          area: areaController.text.trim(),
          block: blockController.text.trim(),
          street: streetController.text.trim(),
          avenue: avenueController.text.trim(),
          building: buildingController.text.trim(),
          floor: floorController.text.trim(),
          apartment: apartmentController.text.trim(),
        );
      });
      userController.currentUser.refresh();
      Get.back();
    }
  }

  @override
  void dispose() {
    goverorateController.dispose();
    areaController.dispose();
    blockController.dispose();
    streetController.dispose();
    avenueController.dispose();
    buildingController.dispose();
    floorController.dispose();
    apartmentController.dispose();
    super.dispose();
  }
}
