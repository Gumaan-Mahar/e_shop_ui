import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/models/category_model.dart';

class SubCategoriesController extends GetxController {
  List<CategoryModel> subCategories = <CategoryModel>[
    CategoryModel(name: 'Shirt'),
    CategoryModel(name: 'Pants'),
    CategoryModel(name: 'SweatShirt'),
    CategoryModel(name: 'Jeans'),
    CategoryModel(name: 'CollarShirt'),
    CategoryModel(name: 'Blazers'),
    CategoryModel(name: 'Hoodies'),
    CategoryModel(name: 'Upper'),
    CategoryModel(name: 'Lower'),
    CategoryModel(name: 'Socks'),
  ];
}
