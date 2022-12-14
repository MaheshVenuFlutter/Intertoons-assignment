// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.message,
    this.data,
  });

  String? message;
  Data? data;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.sliderBanners,
    this.additionalBanners,
    this.featuredProducts,
    this.bestsellerProducts,
  });

  List<Banner>? sliderBanners;
  List<Banner>? additionalBanners;
  List<FeaturedProduct>? featuredProducts;
  List<BestsellerProduct>? bestsellerProducts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sliderBanners: List<Banner>.from(
            json["slider_banners"].map((x) => Banner.fromJson(x))),
        additionalBanners: List<Banner>.from(
            json["additional_banners"].map((x) => Banner.fromJson(x))),
        featuredProducts: List<FeaturedProduct>.from(
            json["featured_products"].map((x) => FeaturedProduct.fromJson(x))),
        bestsellerProducts: List<BestsellerProduct>.from(
            json["bestseller_products"]
                .map((x) => BestsellerProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slider_banners":
            List<dynamic>.from(sliderBanners!.map((x) => x.toJson())),
        "additional_banners":
            List<dynamic>.from(additionalBanners!.map((x) => x.toJson())),
        "featured_products":
            List<dynamic>.from(featuredProducts!.map((x) => x.toJson())),
        "bestseller_products":
            List<dynamic>.from(bestsellerProducts!.map((x) => x.toJson())),
      };
}

class Banner {
  Banner({
    this.id,
    this.bannerOrder,
    this.bannerImg,
  });

  int? id;
  String? bannerOrder;
  String? bannerImg;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        bannerOrder: json["banner_order"],
        bannerImg: json["banner_img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "banner_order": bannerOrder,
        "banner_img": bannerImg,
      };
}

class BestsellerProduct {
  BestsellerProduct({
    this.id,
    this.qty,
    this.name,
    this.sku,
    this.categoryId,
    this.categoryName,
    this.isVeg,
    this.menuStatus,
    this.description,
    this.price,
    this.specialPrice,
    this.availableFrom,
    this.availableTo,
    this.image,
    this.variations,
    this.orderCount,
  });

  int? id;
  int? qty;
  String? name;
  String? sku;
  String? categoryId;
  String? categoryName;
  String? isVeg;
  String? menuStatus;
  String? description;
  String? price;
  dynamic specialPrice;
  String? availableFrom;
  String? availableTo;
  String? image;
  List<BestsellerProductVariation>? variations;
  dynamic orderCount;

  factory BestsellerProduct.fromJson(Map<String, dynamic> json) =>
      BestsellerProduct(
        id: json["id"],
        qty: json["qty"],
        name: json["name"],
        sku: json["sku"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        isVeg: json["is_veg"],
        menuStatus: json["menu_status"],
        description: json["description"],
        price: json["price"],
        specialPrice: json["special_price"],
        availableFrom: json["available_from"],
        availableTo: json["available_to"],
        image: json["image"],
        variations: json["variations"] == null
            ? null
            : List<BestsellerProductVariation>.from(json["variations"]
                .map((x) => BestsellerProductVariation.fromJson(x))),
        orderCount: json["order_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "qty": qty,
        "name": name,
        "sku": sku,
        "category_id": categoryId,
        "category_name": categoryName,
        "is_veg": isVeg,
        "menu_status": menuStatus,
        "description": description,
        "price": price,
        "special_price": specialPrice,
        "available_from": availableFrom,
        "available_to": availableTo,
        "image": image,
        "variations": variations == null
            ? null
            : List<dynamic>.from(variations!.map((x) => x.toJson())),
        "order_count": orderCount,
      };

  toMap() {}

  static fromMap(Map<String, dynamic> map) {}
}

class BestsellerProductVariation {
  BestsellerProductVariation({
    this.id,
    this.title,
    this.price,
    this.specialPrice,
  });

  int? id;
  String? title;
  String? price;
  String? specialPrice;

  factory BestsellerProductVariation.fromJson(Map<String, dynamic> json) =>
      BestsellerProductVariation(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        specialPrice: json["special_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "special_price": specialPrice,
      };
}

class FeaturedProduct {
  FeaturedProduct({
    this.id,
    this.name,
    this.sku,
    this.categoryId,
    this.categoryName,
    this.isVeg,
    this.description,
    this.price,
    this.specialPrice,
    this.availableFrom,
    this.availableTo,
    this.image,
    this.variations,
  });

  int? id;
  String? name;
  String? sku;
  String? categoryId;
  String? categoryName;
  String? isVeg;
  String? description;
  String? price;
  dynamic specialPrice;
  String? availableFrom;
  String? availableTo;
  String? image;
  List<FeaturedProductVariation>? variations;

  factory FeaturedProduct.fromJson(Map<String, dynamic> json) =>
      FeaturedProduct(
        id: json["id"],
        name: json["name"],
        sku: json["sku"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        isVeg: json["is_veg"],
        description: json["description"],
        price: json["price"],
        specialPrice: json["special_price"],
        availableFrom: json["available_from"],
        availableTo: json["available_to"],
        image: json["image"],
        variations: List<FeaturedProductVariation>.from(json["variations"]
            .map((x) => FeaturedProductVariation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sku": sku,
        "category_id": categoryId,
        "category_name": categoryName,
        "is_veg": isVeg,
        "description": description,
        "price": price,
        "special_price": specialPrice,
        "available_from": availableFrom,
        "available_to": availableTo,
        "image": image,
        "variations": List<dynamic>.from(variations!.map((x) => x.toJson())),
      };
}

class FeaturedProductVariation {
  FeaturedProductVariation({
    this.id,
    this.title,
    this.price,
    this.specialPrice,
  });

  int? id;
  String? title;
  String? price;
  dynamic specialPrice;

  factory FeaturedProductVariation.fromJson(Map<String, dynamic> json) =>
      FeaturedProductVariation(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        specialPrice: json["special_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "special_price": specialPrice,
      };
}
