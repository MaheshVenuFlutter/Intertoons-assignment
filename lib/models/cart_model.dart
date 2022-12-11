import 'package:need_to/models/user_model.dart';

class CartModel {
  int? id;
  String? name;
  String? price;
  int? quantity;
  bool? isExist;
  String? time;
  String? img;
  List<BestsellerProductVariation>? variations;

  BestsellerProduct? product;

  CartModel({
    this.quantity,
    this.isExist,
    this.time,
    this.id,
    this.name,
    this.price,
    this.img,
    this.product,
    this.variations,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    price = json['price'];
    img = json['img'];
    variations:
    json["variations"] == null
        ? null
        : List<BestsellerProductVariation>.from(json["variations"]
            .map((x) => BestsellerProductVariation.fromJson(x)));
    product = BestsellerProduct.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "img": this.img,
      "quantity": this.quantity,
      "isExist": this.isExist,
      "time": this.time,
      "product": this.product!.toJson(),
      "variations": variations == null
          ? null
          : List<dynamic>.from(variations!.map((x) => x.toJson())),
    };
  }
}
