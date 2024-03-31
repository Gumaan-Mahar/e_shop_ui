import 'package:e_shop_ui/buyer/models/product_model.dart';
import 'package:e_shop_ui/common/models/user_model.dart';

class OrderModel {
  int? id;
  DateTime? placedAt;
  String? status;
  AddressModel? address;
  String? phone;
  double? total;
  String? promoCode;
  String? paymentMode;
  List<ProductModel>? products;

  OrderModel({
    this.id,
    this.placedAt,
    this.status,
    this.address,
    this.phone,
    this.total,
    this.promoCode,
    this.paymentMode,
    this.products,
  });
}
