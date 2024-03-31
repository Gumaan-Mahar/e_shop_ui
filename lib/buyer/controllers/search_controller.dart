import 'package:get/get.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

class SearchController extends GetxController {
  final TextEditingController queryController = TextEditingController();
  final RxInt resultsCount = 8.obs;

  final searchFuture = Future.value().obs;

  @override
  void onClose() {
    queryController.dispose();
    super.onClose();
  }
}
