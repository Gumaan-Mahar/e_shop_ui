import 'dart:convert';

class ProductModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final List<String>? images;
  final List<String>? sizes;
  final List<String>? colors;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.images,
    this.sizes,
    this.colors,
  });

  ProductModel copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    List<String>? images,
    List<String>? sizes,
    List<String>? colors,
  }) =>
      ProductModel(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
        images: images ?? this.images,
        sizes: sizes ?? this.sizes,
        colors: colors ?? this.colors,
      );

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]),
        sizes: json["sizes"] == null ? [] : List<String>.from(json["sizes"]),
        colors: json["colors"] == null ? [] : List<String>.from(json["colors"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "images": images == null ? [] : List<String>.from(images!),
        "sizes": sizes == null ? [] : List<String>.from(sizes!),
        "colors": colors == null ? [] : List<String>.from(colors!),
      };
}
