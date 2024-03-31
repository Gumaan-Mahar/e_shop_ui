import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

class GetOtpController extends GetxController{
  final TextEditingController number = TextEditingController();
  final   GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onClose() {
   number.dispose();
    super.onClose();
  }
}