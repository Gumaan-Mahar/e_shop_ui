class OrderModel {
  int orderId;
  DateTime orderedDate;
  DateTime outForDeliveryDate;
  DateTime deliveredDate;
  String deliveryAddress;
  double subTotal;
  String codeApplied;
  int discount;
  double deliveryCharges;
  String paymentMethod;

  OrderModel({
    required this.orderId,
    required this.orderedDate,
    required this.outForDeliveryDate,
    required this.deliveredDate,
    required this.deliveryAddress,
    required this.subTotal,
    required this.codeApplied,
    required this.discount,
    required this.deliveryCharges,
    required this.paymentMethod,
  });
}
