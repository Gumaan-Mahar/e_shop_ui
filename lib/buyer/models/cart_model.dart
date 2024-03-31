class CartModel {
  final int? id;
  double? total;
  final List<CartItemModel>? items;

  CartModel({
    this.id,
    this.total,
    this.items,
  });
}

class CartItemModel {
  final int? id;
  int? quantity;
  final double? price;
  final String? name;
  final String? description;
  final String? image;
   String? size;
   String? color;
  final List<String>? sizes;
  final List<String>? colors;

  CartItemModel({
    this.id,
    this.name,
    this.quantity,
    this.price,
    this.description,
    this.image,
    this.size,
    this.color,
    this.sizes,
    this.colors,
  });
}
