// To parse this JSON data, do
//
//     final cartResponseModel = cartResponseModelFromJson(jsonString);

import 'dart:convert';

CartResponseModel cartResponseModelFromJson(String str) => CartResponseModel.fromJson(json.decode(str));

String cartResponseModelToJson(CartResponseModel data) => json.encode(data.toJson());

class CartResponseModel {
  CartResponseModel({
    this.timestamp,
    this.status,
    this.statusCode,
    this.statusSubCode,
    this.message,
    this.hostName,
    this.requestId,
    this.data,
  });

  DateTime? timestamp;
  int? status;
  String? statusCode;
  String? statusSubCode;
  String? message;
  String? hostName;
  String? requestId;
  Data? data;

  factory CartResponseModel.fromJson(Map<String, dynamic> json) => CartResponseModel(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    statusCode: json["statusCode"],
    statusSubCode: json["statusSubCode"],
    message: json["message"],
    hostName: json["hostName"],
    requestId: json["requestId"],
    data: json["response"] == null ? null : Data.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "statusCode": statusCode,
    "statusSubCode": statusSubCode,
    "message": message,
    "hostName": hostName,
    "requestId": requestId,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.cartType,
    this.cartId,
    this.userId,
    this.cartItems,
    this.subTotalAmount,
    this.estimatedTax,
    this.shippingPrice,
    this.totalAmount,
  });

  String? cartType;
  String? cartId;
  String? userId;
  List<CartItem>? cartItems;
  double? subTotalAmount;
  double? estimatedTax;
  double? shippingPrice;
  double? totalAmount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cartType: json["cartType"],
    cartId: json["cartId"],
    userId: json["userId"],
    cartItems: json["cartItems"] == null ? [] : List<CartItem>.from(json["cartItems"]!.map((x) => CartItem.fromJson(x))),
    subTotalAmount: json["subTotalAmount"],
    estimatedTax: json["estimatedTax"],
    shippingPrice: json["shippingPrice"],
    totalAmount: json["totalAmount"],
  );

  Map<String, dynamic> toJson() => {
    "cartType": cartType,
    "cartId": cartId,
    "userId": userId,
    "cartItems": cartItems == null ? [] : List<dynamic>.from(cartItems!.map((x) => x.toJson())),
    "subTotalAmount": subTotalAmount,
    "estimatedTax": estimatedTax,
    "shippingPrice": shippingPrice,
    "totalAmount": totalAmount,
  };
}

class CartItem {
  CartItem({
    this.sellerProductId,
    this.quantity,
    this.productName,
    this.productPrice,
    this.productSellingPrice,
    this.imageList,
    this.thumbnailImage,
  });

  String? sellerProductId;
  int? quantity;
  String? productName;
  double? productPrice;
  double? productSellingPrice;
  List<String>? imageList;
  String? thumbnailImage;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    sellerProductId: json["sellerProductId"],
    quantity: json["quantity"],
    productName: json["productName"],
    productPrice: json["productPrice"],
    productSellingPrice: json["productSellingPrice"],
    imageList: json["imageList"] == null ? [] : List<String>.from(json["imageList"]!.map((x) => x)),
    thumbnailImage: json["thumbnailImage"],
  );

  Map<String, dynamic> toJson() => {
    "sellerProductId": sellerProductId,
    "quantity": quantity,
    "productName": productName,
    "productPrice": productPrice,
    "productSellingPrice": productSellingPrice,
    "imageList": imageList == null ? [] : List<dynamic>.from(imageList!.map((x) => x)),
    "thumbnailImage": thumbnailImage,
  };
}
