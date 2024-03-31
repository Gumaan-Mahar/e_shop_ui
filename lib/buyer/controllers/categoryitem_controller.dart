import 'package:get/get.dart';
import 'package:e_shop_ui/buyer/models/product_model.dart';
import 'package:e_shop_ui/buyer/services/product_services.dart';

class CategoryItemController extends GetxController {
 final productsFuture = Future.value().obs;

  final RxList<ProductModel> products = <ProductModel>[].obs;

  @override
  void onInit() {
    productsFuture.value = ProductServices.getProducts(limit: 4);

    products.value = [
      ProductModel(
        id: 1,
        title: 'Product 1',
        price: 100,
        description: 'Product 1 description',
        category: 'Category 1',
        image: 'assets/images/product_1.png',
        images: [
          'assets/images/product_1.png',
          'assets/images/product_2.png',
          'assets/images/product_1.png',
        ],
        sizes: [
          'S',
          'M',
          'L',
          'XL',
        ],
        colors: [
          '#000000',
          '#364f6b',
          '#feb062',
          '#dee1ec',
        ],
      ),
      ProductModel(
        id: 2,
        title: 'Product 2',
        price: 100,
        description: 'Product 2 description',
        category: 'Category 2',
        image: 'assets/images/product_3.png',
        images: [
          'assets/images/product_3.png',
          'assets/images/product_3.png',
          'assets/images/product_3.png',
        ],
        sizes: [
          'S',
          'M',
          'L',
          'XL',
        ],
        colors: [
          '#000000',
          '#364f6b',
          '#feb062',
          '#dee1ec',
        ],
      ),
      ProductModel(
        id: 3,
        title: 'Product 3',
        price: 100,
        description: 'Product 3 description',
        category: 'Category 3',
        image: 'assets/images/product_1.png',
        images: [
          'assets/images/product_1.png',
          'assets/images/product_2.png',
          'assets/images/product_1.png',
        ],
        sizes: [
          'S',
          'M',
          'L',
          'XL',
        ],
        colors: [
          '#000000',
          '#364f6b',
          '#feb062',
          '#dee1ec',
        ],
      ),
      ProductModel(
        id: 4,
        title: 'Product 4',
        price: 100,
        description: 'Product 4 description',
        category: 'Category 4',
        image: 'assets/images/product_3.png',
        images: [
          'assets/images/product_3.png',
          'assets/images/product_3.png',
          'assets/images/product_3.png',
        ],
        sizes: [
          'S',
          'M',
          'L',
          'XL',
        ],
        colors: [
          '#000000',
          '#364f6b',
          '#feb062',
          '#dee1ec',
        ],
      ),
    ];
    super.onInit();
  }
}