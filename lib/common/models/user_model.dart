class User {
  String? name;
  String? email;
  String? phoneNo;
  String? image;
  AddressModel? address;
  SellerModel? seller;
  User({
    this.name,
    this.email,
    this.phoneNo,
    this.image,
    this.address,
    this.seller,
  });
}

class SellerModel {
  String? name;
  String? category;
  int? products;
  String? shopAddress;
  String? phoneNo;
  SellerModel({
    this.name,
    this.category,
    this.products,
    this.shopAddress,
    this.phoneNo,
  });
}

class AddressModel {
  String? goverorate;
  String? area;
  String? block;
  String? street;
  String? avenue;
  String? building;
  String? floor;
  String? apartment;

  AddressModel({
    this.goverorate,
    this.area,
    this.block,
    this.street,
    this.avenue,
    this.building,
    this.floor,
    this.apartment,
  });
}
