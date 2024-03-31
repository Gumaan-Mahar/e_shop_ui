import 'package:dio/dio.dart';
import 'package:e_shop_ui/buyer/models/product_model.dart';
import 'package:e_shop_ui/config/dio.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

class ProductServices {
  static Future<List<ProductModel?>> getProducts({int? limit}) async {
    try {
      final Response response = await dio.get(limit == null
          ? Endpoints.products
          : "${Endpoints.products}?limit=$limit");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
