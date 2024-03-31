import 'product_variation_model.dart';

class ProductModel {
  final String? id;
  final String? name;
  final String? arName;
  final double? price;
  final String? description;
  final String? arDescription;
  final int? categoryId;
  final String? displayImage;
  final List<String>? images;
  final List<ProductVariationModel>? variations;
  final List<String>? colors;
  final int? noOfStocks;

  ProductModel({
    this.id,
    this.name,
    this.arName,
    this.price,
    this.description,
    this.arDescription,
    this.categoryId,
    this.displayImage,
    this.images,
    this.variations,
    this.colors,
    this.noOfStocks,
  });
}
