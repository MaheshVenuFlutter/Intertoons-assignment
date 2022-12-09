import 'package:need_to/models/user_model.dart';

class OrderModel {
  int? id;
  String? sku;
  String? name;
  String? description;
  String? image;
  String? price;
  dynamic specialPrice;
  String? availableFrom;
  String? availableTo;
  String? isVeg;
  dynamic variations;

  BestsellerProduct? product;

  OrderModel({
    this.id,
    this.name,
    this.product,
    this.sku,
    this.description,
    this.image,
    this.price,
    this.specialPrice,
    this.availableFrom,
    this.availableTo,
    this.isVeg,
    this.variations,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    product = json['product'];
    sku = json['sku'];
    description = json['description'];
    image = json['image'];
    price = json['price'];

    specialPrice = json['specialPrice'];
    availableFrom = json['availableFrom'];
    availableTo = json['availableTo'];
    isVeg = json['isVeg'];
    variations = json['variations'];
    product = BestsellerProduct.fromJson(json['product']);
  }

  Map<String, dynamic> tojson() {
    return {
      "id": this.id,
      "name": this.name,
      "sku": this.sku,
      "description": this.description,
      "image": this.image,
      "price": this.price,
      "specialPrice": this.specialPrice,
      "availableFrom": this.availableFrom,
      "availableTo": this.availableTo,
      "isVeg": this.isVeg,
      "variations": this.variations,
      "product": this.product!.toJson(),
    };
  }
}
