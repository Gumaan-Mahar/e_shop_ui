import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/models/category_model.dart';

class CategoriesController extends GetxController {
  List<CategoryModel> categories = <CategoryModel>[
    CategoryModel(name: 'All', image: 'assets/images/categories.jpg'),
    CategoryModel(name: 'Men', image: 'assets/images/categories.jpg'),
    CategoryModel(name: 'Women', image: 'assets/images/categories.jpg'),
    CategoryModel(name: 'Kids', image: 'assets/images/categories.jpg'),
    CategoryModel(name: 'Bedding', image: 'assets/images/categories.jpg'),
    CategoryModel(name: 'Home', image: 'assets/images/categories.jpg'),
    CategoryModel(name: 'Accessories', image: 'assets/images/categories.jpg'),
    CategoryModel(name: 'Decor', image: 'assets/images/categories.jpg'),
    CategoryModel(name: 'Pants', image: 'assets/images/categories.jpg'),
    CategoryModel(name: 'Furniture', image: 'assets/images/categories.jpg'),
    CategoryModel(name: 'Electronics', image: 'assets/images/categories.jpg'),
    CategoryModel(name: 'Crockry', image: 'assets/images/categories.jpg'),
  ];
}
