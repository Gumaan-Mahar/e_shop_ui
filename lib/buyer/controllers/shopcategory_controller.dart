import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/models/category_model.dart';

class ShopCategoryController extends GetxController {
   List<CategoryModel> categories = <CategoryModel>[
    CategoryModel(name: 'All', image: 'assets/images/men.jpeg'),
    CategoryModel(name: 'Men', image: 'assets/images/men.jpeg'),
    CategoryModel(name: 'Women', image: 'assets/images/men.jpeg'),
    CategoryModel(name: 'Kids', image: 'assets/images/men.jpeg'),
    CategoryModel(name: 'Bedding', image: 'assets/images/men.jpeg'),
    CategoryModel(name: 'Home', image: 'assets/images/men.jpeg'),
    CategoryModel(name: 'Accessories', image: 'assets/images/men.jpeg'),
    CategoryModel(name: 'Decor', image: 'assets/images/men.jpeg'),
    CategoryModel(name: 'Pants', image: 'assets/images/men.jpeg'),
    CategoryModel(name: 'Furniture', image: 'assets/images/men.jpeg'),
    CategoryModel(name: 'Electronics', image: 'assets/images/men.jpeg'),
    CategoryModel(name: 'Crockry', image: 'assets/images/men.jpeg'),
  ];
}