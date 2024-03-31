import 'package:get/get.dart';

import '../models/product_model.dart';

class HomeScreenController extends GetxController {
  final RxList<ProductModel> products = <ProductModel>[].obs;
}
